FactoryGirl.define do
  factory :room do
    name { Faker::Internet.slug }
    uid { Faker::Number.number(5) }
  end

end
