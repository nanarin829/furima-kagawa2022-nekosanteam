FactoryBot.define do
  factory :address do
    post_code              { '123-4567' }
    prefecture_id          { Faker::Number.between(from: 2) }
    city                   { '横浜市緑区' }
    address                { 'あおやま1-1-1' }
    phone_num               { Faker::Number.number(10) }
  end
end