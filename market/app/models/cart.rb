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
end
