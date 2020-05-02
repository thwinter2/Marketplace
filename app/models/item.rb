class Item < ApplicationRecord
	# belongs_to :cart
	# belongs_to :wishlist
	has_many :purchase_histories, :class_name => 'PurchaseHistory', :foreign_key => 'item_id', dependent: :delete_all

	validates :name, presence: true
	validates :brand, presence: true
	validates :category, presence: true
	validates :description, presence: true
	validates :image, presence: true
	validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 0}
	validates :cost, numericality: {greater_than: 0}
	validates :tax_slab, presence: true


	def self.search_category(category)
		if category != ""
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

	def self.search_brand(brand)
		if brand != ""
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

	def self.search_availability(availability)
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
