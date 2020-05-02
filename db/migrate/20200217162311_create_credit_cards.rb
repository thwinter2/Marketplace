class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.references :user
      t.string :card_name
      t.integer :card_num
      t.date :card_experation
      t.integer :card_cvv

      t.timestamps
    end
  end
end
