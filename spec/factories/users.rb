FactoryBot.define do
  factory :user do
    nickname { 'rara' }
    email { Faker::Internet.email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name { 'らら' }
    first_name { 'らら' }
    family_name_kana { 'ララ' }
    first_name_kana { 'ララ' }
    birth_day { '1930-1-1' }
  end
end
