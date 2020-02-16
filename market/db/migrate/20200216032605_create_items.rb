class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :unique_id
      t.string :name
      t.string :brand
      t.string :category
      t.text :description
      t.string :image
      t.boolean :special_item
      t.boolean :age_restricted
      t.integer :quantity
      t.decimal :cost
      t.string :tax_slab
      t.integer :views_count

      t.timestamps
    end
  end
end
