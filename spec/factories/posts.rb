FactoryBot.define do
 factory :post do
  prefecture_id       {"1"}
  title               { Faker::Lorem.characters(number: 10) }
  access              { Faker::Lorem.characters(number: 20) }
  authorization       { Faker::Lorem.characters(number: 20) }
  drone_type          { Faker::Lorem.characters(number: 10) }
  remarks             { Faker::Lorem.characters(number: 20) }
  rate                {"3"}
  shooting_date       {"2022/01/01"}
  request             {"該当なし"}
  customer

  after(:build) do |post|
   post.image.attach(io: File.open('spec/fixtures/test.jpeg'), filename: 'test.jpeg', content_type: 'image/jpeg')
  end
 end
end