FactoryBot.define do
  factory :user_infomation do
    post_code { '573-0013' }
    shipping_area_id { 2 }
    city { '枚方市' }
    house_name { '星丘2-44-10-2' }
    phone_number { '11111111111' }
  end
end
