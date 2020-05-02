class Feedback < ApplicationRecord
	validates :email, :note, presence: true
	validates :email, format: {with: /\w+@[a-zA-Z]+\.[a-zA-Z]{2,}/}
end
