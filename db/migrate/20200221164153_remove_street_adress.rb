class RemoveStreetAdress < ActiveRecord::Migration[6.0]
  def change
  	remove_column :users, :street_address, :string
  end
end
