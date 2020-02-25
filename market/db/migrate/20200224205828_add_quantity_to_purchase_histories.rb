class AddQuantityToPurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    add_column :purchase_histories, :quantity, :integer
  end
end
