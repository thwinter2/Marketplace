class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_one :cart, :class_name => 'Cart', :foreign_key => 'user_id'
	has_many :items, through: :cart
	has_many :feedbacks, :class_name => 'Feedback', :foreign_key => 'user_id'
	has_one :purchase_histories, :class_name => 'PurchaseHistory', :foreign_key => 'user_id'
	has_many :credit_cards, :class_name => 'CreditCard', :foreign_key => 'user_id'
	has_one :wishlist, :class_name => 'Wishlist', :foreign_key => 'user_id'
	has_many :items, through: :wishlist

	#validates :user, :name, :email, :password, :phone, :dob, :street_address, :city, :state, :zip, presence: true
	#validates :card_experation, format: {with: /[0|1][0-9]}
end
