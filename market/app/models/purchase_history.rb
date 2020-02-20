class PurchaseHistory < ApplicationRecord
  # belongs_to :user
  # belongs_to :item
  has_many :items , :class_name => 'Item', :foreign_key => 'item_id'
end