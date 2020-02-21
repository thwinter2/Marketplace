class AddItemIdToWishlists < ActiveRecord::Migration[6.0]
  def change
    add_reference :wishlists, :item
  end
end
