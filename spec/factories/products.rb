FactoryBot.define do
  factory :product do
    title {Faker::Lorem.word}
    description {Faker::Lorem.sentence}
    price {100}
  end
end
