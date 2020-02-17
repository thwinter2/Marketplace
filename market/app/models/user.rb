class User < ApplicationRecord
	has_many :items
	has_many :feedbacks, :class_name => 'Feedback', :foreign_key => 'user_id'
end
