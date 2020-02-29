class User < ApplicationRecord
	has_one :cart
	has_many :cart_items, through: :cart
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

	# has_many :cart, :class_name => 'Cart', :foreign_key => 'user_id', dependent: :delete_all
	has_many :items, through: :cart
	has_many :purchase_histories, :class_name => 'PurchaseHistory', :foreign_key => 'user_id', dependent: :delete_all
	has_many :credit_cards, :class_name => 'CreditCard', :foreign_key => 'user_id', dependent: :delete_all
	has_many :wishlist, :class_name => 'Wishlist', :foreign_key => 'user_id', dependent: :delete_all
	has_many :items, through: :wishlist

	validates :name, :phone, :dob, :street_addres, :city, :state, :zip, presence: true
	validates :phone, format: {with: /\d{3}-\d{3}-\d{4}/}
	validates :zip, format: {with: /\d{5}/}
	validates :street_addres, format: {with: /\d+ .*/}

	def self.from_omniauth(auth)
	  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
		    user.email = auth.info.email
		    user.password = Devise.friendly_token[0, 20]
		    user.name = auth.info.name
	  	end
	end

	def self.new_with_session(params, session)
	    super.tap do |user|
	      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
	        user.email = data["email"] if user.email.blank?
	      end
	    end
  	end

	def age(dob)
		now = Time.now.utc.to_date
		if dob.nil?
			dob = now
		end
		now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
	end

	def create_new_credit_card(credit_card_params)
		credit_cards.new(credit_card_params)
	end

end

