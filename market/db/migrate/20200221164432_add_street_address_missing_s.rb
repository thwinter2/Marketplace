class AddStreetAddressMissingS < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :street_addres, :string
  end
end
