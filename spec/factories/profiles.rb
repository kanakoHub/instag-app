FactoryBot.define do
  factory :profile do
    account { Faker::Name.name }
  end
end