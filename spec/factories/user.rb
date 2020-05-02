FactoryBot.define do
    factory :user do
        name {'RSpec Test'}
        password {'password'}
        password_confirmation {'password'}
        phone {'111-222-3333'}
        dob {'1920-01-01'}
        street_addres {'123 Meeting St'}
        city {'Raleigh'}
        state {'NC'}
        zip {27606}

        factory :regular_user do
            email {'RSpec@testing.com'}
            admin {false}
        end

        factory :admin do
            email {'adminRspec@testing.com'}
            admin {true}
        end
    end
end