class CreatePurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_histories do |t|
      t.references :user
      t.references :item
      t.string :status

      t.timestamps
    end
  end
end
