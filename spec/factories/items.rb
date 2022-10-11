FactoryBot.define do
  factory :item do
    name             { Faker::Lorem.sentence }
    description      { Faker::Lorem.sentence }
    price            { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id      { Faker::Number.between(from: 2) }
    state_id         { Faker::Number.between(from: 2) }
    burden_id        { Faker::Number.between(from: 2) }
    prefecture_id    { Faker::Number.between(from: 2) }
    workday_id       { Faker::Number.between(from: 2) }
    association :user
  end
end
