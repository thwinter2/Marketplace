class AddEmailToFeedbacks < ActiveRecord::Migration[6.0]
  def change
    add_column :feedbacks, :email, :string
  end
end
