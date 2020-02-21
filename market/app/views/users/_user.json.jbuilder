json.extract! user, :id, :name, :email, :password, :phone, :dob, :street_addres, :city, :state, :zip, :card_name, :card_num, :card_expiration, :card_cvv, :cart, :wishlist, :created_at, :updated_at
json.url user_url(user, format: :json)
