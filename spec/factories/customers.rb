FactoryBot.define do
 factory :customer do
  last_name             { Faker::Lorem.characters(number: 2) }
  first_name            { Faker::Lorem.characters(number: 2) }
  last_name_kana        { Faker::Lorem.characters(number: 4) }
  first_name_kana       { Faker::Lorem.characters(number: 4) }
  nick_name             { Faker::Lorem.characters(number: 3) }
  email                 { "taro@test.com" }
  password              { 'password' }
  password_confirmation { 'password' }
 end
end