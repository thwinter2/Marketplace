class AddOtpToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :otp, :integer
  end
end
