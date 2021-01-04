FactoryBot.define do
  factory :snap do
    description { Faker::Lorem.characters(number: 10) }
  end
end