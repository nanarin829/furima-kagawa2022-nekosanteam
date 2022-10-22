FactoryBot.define do
  factory :order_address do
    token                   { '424242424242' }
    post_code              { '123-4567' }
    prefecture_id          { Faker::Number.between(from: 2) }
    city                   { '横浜市緑区' }
    address                { 'あおやま1-1-1' }
    building               { '柳ビル１０３' }
    phone_num               { Faker::Number.number(10) }
  end
end