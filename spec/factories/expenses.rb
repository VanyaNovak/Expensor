FactoryBot.define do
  factory :expense do
    description { Faker::Lorem.word }
    price_cents { Faker::Number.digit }

    association :user
    association :category
  end
end
