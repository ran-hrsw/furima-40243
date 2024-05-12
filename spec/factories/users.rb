FactoryBot.define do
  factory :user do
    nickname { 'rara' }
    email { Faker::Internet.email }
    password { Faker::Internet + '1a'.password(min_length: 6) }
    password_confirmation { password }
    family_name { 'らら' }
    first_name { 'らら' }
    family_name_kana { 'ララ' }
    first_name_kana { 'ララ' }
    birth_day { '1930-1-1' }
  end
end
