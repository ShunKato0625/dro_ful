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
  image { [ Rack::Test::UploadedFile.new(Rails.root.join( 'app/assets/images/test.jpeg'), 'app/assets/images/test.jpeg')  ]} #画像はjson型なので[]で画像データを囲む必要がある。
  association :customer #@postモデルは@userが投稿するので、関連付けを定義する。
 end
end