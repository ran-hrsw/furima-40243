FactoryBot.define do
  factory :user do
    nickname { 'rara' }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    family_name { 'rara' }
    first_name { 'rara' }
    family_name_kana { 'rara' }
    first_name_kana { 'rara' }
    birth_day { '1930-1-1' }
  end
end
