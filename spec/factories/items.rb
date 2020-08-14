FactoryBot.define do
  factory :item do
    name { "aaaaa" }
    text { "aaaaa" }
    category_id { 2 }
    status_id { 2 }
    delivery_fee_id { 2 }
    shipping_area_id { 2 }
    shipping_date_id { 2 }
    price { 301 }
    association :user
  end
end
