FactoryBot.define do
  factory :item do
    association :user
    price { 300 }
    item_name { 'rara' }
    item_description { 'rara' }
    category_id { 2 }
    status_id { 2 }
    cost_id { 2 }
    address_id { 2 }
    transit_time_id { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_furima.png'), filename: 'test_furima.png')
    end
  end
end
