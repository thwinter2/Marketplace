class AddReturnToPurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    add_column :purchase_histories, :return, :string
  end
end
