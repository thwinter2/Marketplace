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

	#validates :name, :phone, :dob, :city, :zip, presence: true
	#validates :phone, format: {with: /\d{3}-\d{3}-\d{4}/}
	#validates :zip, length: {is: 5}
	#validates :street_address, format: {with: /\d+ [a-zA-Z]+ [a-zA-Z]+/}

		def age(dob)
			now = Time.now.utc.to_date
			if dob.nil?
				dob = now
			end
			now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
		end

end

