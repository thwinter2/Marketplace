class User < ApplicationRecord
	has_one :cart, :class_name => 'Cart', :foreign_key => 'user_id'
	has_many :items, through: :cart
	has_many :feedbacks, :class_name => 'Feedback', :foreign_key => 'user_id'
	has_one :purchase_histories, :class_name => 'PurchaseHistory', :foreign_key => 'user_id'
	has_many :credit_cards, :class_name => 'CreditCard', :foreign_key => 'user_id'
	has_one :wishlist, :class_name => 'Wishlist', :foreign_key => 'user_id'
	has_many :items, through: :wishlist
end
