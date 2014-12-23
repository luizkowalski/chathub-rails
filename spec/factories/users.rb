FactoryGirl.define do

  factory :user do
    nickname { Faker::Internet.user_name }
    email { Faker::Internet.email }
    uid { Faker::Number.number(5) }
  end

end
