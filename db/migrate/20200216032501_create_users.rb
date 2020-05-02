class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phone
      t.date :dob
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :card_name
      t.integer :card_num
      t.date :card_expiration
      t.integer :card_cvv
      t.string :cart
      t.string :wishlist

      t.timestamps
    end
  end
end
