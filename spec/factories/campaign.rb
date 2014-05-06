FactoryGirl.define do

  factory :campaign do
    association :user, factory: :user
    title Faker::Company.bs
    details Faker::Lorem.paragraph
    target  10000000
    end_date (Time.now + 20.days)

  end


end