class ChangeExpirationToString < ActiveRecord::Migration[6.0]
  def change
  	change_column :credit_cards, :card_experation, :string
  end
end
