class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.references :user
      t.string :visitor_email
      t.text :note

      t.timestamps
    end
    add_foreign_key :feedbacks, :users, column: :user_id, primary_key: :id
  end
end
