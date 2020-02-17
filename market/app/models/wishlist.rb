class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :items , :class_name => 'Item', :foreign_key => 'item_id'
end
