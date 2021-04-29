FactoryBot.define do
  factory :item do
    name { 'あ' }
    price { 300 }
    text { Faker::Lorem.sentence }
    category_id { 2 }
    status_id { 2 }
    deli_price_id { 2 }
    area_id { 2 }
    deli_day_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.png'), filename: 'sample.png')
    end
  end
end
