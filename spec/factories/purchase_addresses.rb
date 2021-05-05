FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefectures { 2 }
    municipality { '横浜市緑区' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_num { '11111111111'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
