class AddTaxPriceToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :tax_slab, :string
    add_column :carts, :price, :integer
  end
end
