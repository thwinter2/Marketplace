class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  def add_item(item_params)
    current_item = cart_items.find_by(item_id: item_params[:item][:item_id])
    if current_item
      current_item.quantity += item_params[:quantity].to_i
      current_item.save
    else
      new_item = cart_items.new(item_id: item_params[:item][:item_id], quantity: item_params[:quantity], cart_id: self.id)
    end
    new_item
  end

  def buy_items
    notice = ''
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
      purchase_history = cartitem.create_purchase_history(user)
      if purchase_history.status == 'Purchased'
        item.quantity -= cartitem.quantity
        item.save
      else
        notice += 'The ' + item.name + ' is a special item, and requires admin approval. You will be notified when it is approved. '
        cartitem.destroy
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
