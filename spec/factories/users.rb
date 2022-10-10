FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    last_name             { '田中たなかタナカ' }
    first_name            { '太郎たろうタロウ' }
    last_name_kana        { 'タナカ' }
    first_name_kana       { 'タロウ' }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password }
    password_confirmation { password }
    birth_day             { Faker::Date.birthday }
  end
end
