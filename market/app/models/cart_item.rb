class CartItem < ApplicationRecord
  def create_purchase_history(user)
    item = Item.find(self.item_id)
    if item.special_item
      status = 'Pending Approval'
    else
      status = 'Purchased'
    end
    @purchase_history = PurchaseHistory.new(user_id: user.id, item_id: self.item_id, quantity: self.quantity, status: status)
    @purchase_history.save
    @purchase_history
  end
end
