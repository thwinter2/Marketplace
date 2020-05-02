class ChangeZipToString < ActiveRecord::Migration[6.0]
  def change
  	change_column :users, :zip, :string
  end
end
