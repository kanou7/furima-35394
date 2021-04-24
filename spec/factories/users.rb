FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    family_name { '本田' }
    first_name { '圭佑' }
    family_name_kana { 'ホンダ' }
    first_name_kana { 'ケイスケ' }
    birth { '2014-09-23' }
  end
end
