class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.integer :item_id
      t.integer :cart_id
      t.integer :quantity

      t.timestamps
    end
  end
end
