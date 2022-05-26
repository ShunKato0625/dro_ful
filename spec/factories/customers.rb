FactoryBot.define do

 factory :customer do
  last_name             { Faker::Lorem.characters(number: 2) }
  firast_name           { Faker::Lorem.characters(number: 2) }
  last_name_kana        { Faker::Lorem.characters(number: 4) }
  firast_name           { Faker::Lorem.characters(number: 4) }
  nick_name             { Faker::Lorem.characters(number: 5) }
  email                 { Faker::Internet.email}
  password              { 'password' }
  password_confirmation { 'password' }
 end
end