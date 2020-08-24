FactoryBot.define do
  factory :user_infomation do
    post_code { '573-0013' }
    shipping_area_id { 2 }
    city { '枚方市' }
    house_name { '星丘2-44-10-2' }
    phone_number { '11111111111' }
    token { 'tok_0c94b2472b8267c0b27dad59d3c0' }
  end
end
