class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  def add_item(item_params)
    current_item = cart_items.find_by(item_id: item_params[:item][:item_id])
    if current_item
      current_item.quantity += item_params[:quantity].to_i
      current_item.save
    else
      new_item = cart_items.new(item_id: item_params[:item][:item_id], quantity: item_params[:quantity], buy_now: item_params[:buy_now], cart_id: self.id)
    end
    new_item
  end

  ## For Buy Now option
  def buy_now(item_params)
    new_item = cart_items.new(item_id: item_params[:item][:item_id], quantity: item_params[:quantity], buy_now: item_params[:buy_now], cart_id: self.id)
  end

  def buy_items
    notice = ''
    is_buy_now_item = false
    buy_now_cart_item = cart_items.find {|item| item["buy_now"] == true}
    if buy_now_cart_item
      is_buy_now_item = true
      item = Item.find(buy_now_cart_item.item_id)
      if item.quantity >= buy_now_cart_item.quantity and item.quantity > 0
      elsif item.quantity > 0
        notice += 'Unfortunately, there are only ' + item.quantity.to_s + ' of the ' + item.name + ' in stock. You requested ' + cartitem.quantity.to_s + ' but will only be charged for those available.'
        buy_now_cart_item.quantity = item.quantity
      else
        notice += 'The ' + item.name + ' is currently out of stock. You will not be charged for this item. '
        buy_now_cart_item.destroy
      end
      if user.age(user.dob) < 18 and item.age_restricted?
        notice += 'The ' + item.name + ' is restricted to users above the age of 18. '
        buy_now_cart_item.destroy
      end
      purchase_history = buy_now_cart_item.create_purchase_history(user)
      if purchase_history.status == 'Purchased'
        item.quantity -= buy_now_cart_item.quantity
        item.save
      else
        notice += 'The ' + item.name + ' is a special item, and requires admin approval. You will be notified when it is approved. '
        buy_now_cart_item.destroy
      end
    else
      cart_items.where(cart_id: self.id).each do |cartitem|
        item = Item.find(cartitem.item_id)
        if item.quantity >= cartitem.quantity and item.quantity > 0
        elsif item.quantity > 0
          notice += 'Unfortunately, there are only ' + item.quantity.to_s + ' of the ' + item.name + ' in stock. You requested ' + cartitem.quantity.to_s + ' but will only be charged for those available.'
          cartitem.quantity = item.quantity
        else
          notice += 'The ' + item.name + ' is currently out of stock. You will not be charged for this item. '
          cartitem.destroy
          next
        end
        if user.age(user.dob) < 18 and item.age_restricted?
          notice += 'The ' + item.name + ' is restricted to users above the age of 18. '
          cartitem.destroy
          next
        end
        purchase_history = cartitem.create_purchase_history(user)
        if purchase_history.status == 'Purchased'
          item.quantity -= cartitem.quantity
          item.save
        else
          notice += 'The ' + item.name + ' is a special item, and requires admin approval. You will be notified when it is approved. '
          cartitem.destroy
        end
      end
    end
    notice
  end

  def clear
    CartItem.where(cart_id: self.id).each do |cartitem|
      cartitem.destroy
    end
  end
end
