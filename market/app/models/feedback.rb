class Feedback < ApplicationRecord
	validates :email, format: {with: /\w+@[a-zA-Z]+\.[a-zA-Z]{2,}/}
end
