FactoryBot.define do
 	factory :feedback do
    	email {'RSpec@test.com'}
    	note {'RSpec Controller note'}
    	factory :new_feedback do
    		email {'newRSpec@test.com'}
    		note {'new RSpec Controller note'}
    	end
  end
end