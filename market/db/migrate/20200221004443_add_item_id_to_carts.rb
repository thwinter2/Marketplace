class AddItemIdToCarts < ActiveRecord::Migration[6.0]
  def change
  	add_reference :carts, :item
  end
end
