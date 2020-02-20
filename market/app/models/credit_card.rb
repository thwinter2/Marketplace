class CreditCard < ApplicationRecord
  belongs_to :user
  validates :card_name, :card_num, :card_experation, :card_cvv, presence: true
  validates :card_num, length: {is: 16}
  validates :card_num, uniqueness: true
  #validates :card_experation, format: {with: /[0-1][0-9]\/2[0-9]/}
  validates :card_cvv, numericality: {only_integer: true}
  validates :card_cvv, length: {is: 3}
end
