class RemoveSchemaFromFeedbacks < ActiveRecord::Migration[6.0]
  def change

    remove_column :feedbacks, :visitor_email, :string

    remove_column :feedbacks, :user_id, :integer
  end
end
