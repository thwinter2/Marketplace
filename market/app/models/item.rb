class Item < ApplicationRecord
	# belongs_to :cart
	# belongs_to :wishlist
	has_one :purchase_histories, :class_name => 'PurchaseHistory', :foreign_key => 'item_id'

	def self.category(category)
		if !category.nil?
			categories = Item.where(category: category)
			if categories
				return categories
			else
				return Item.all
			end
		else
			return Item.all
		end
	end

	def self.brand(brand)
		if !brand.nil?
			brands = Item.where(brand: brand)
			if brands
				return brands
			else
				return Item.all
			end
		else
			return Item.all
		end
	end

	def self.availability(availability)
		if !availability.nil?
			stocked = Item.where("quantity > 0")
			if stocked
				return stocked
			else
				return Item.all
			end
		else
			return Item.all
		end
	end
end
