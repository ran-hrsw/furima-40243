FactoryBot.define do
  factory :buying_address do
    post_code { '123_4567' }
    city { 3 }
    address_id { '大阪市中央区' }
    number { '東平1-1-1' }
    building_name { 'パークスクエア' }
    phone_number { '09012345678' }
    token {}

    association :user_id
    association :item_id
  end
end
