class Item < ApplicationRecord
	# belongs_to :cart
	# belongs_to :wishlist
	has_one :purchase_histories, :class_name => 'PurchaseHistory', :foreign_key => 'item_id'
end
