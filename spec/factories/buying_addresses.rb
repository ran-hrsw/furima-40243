FactoryBot.define do
  factory :buying_address do
    post_code { '123-4567' }
    city { 3 }
    address_id { '1' }
    number { '1-1-1' }
    building_name { 'パークスクエア' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }

    # association :user_id
    # association :item_id
  end
end
