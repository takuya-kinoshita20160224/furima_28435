class UserInfomation
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :city, :house_name, :building_name, :phone_number, :shipping_area_id, :token, :soldout

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :city
    validates :house_name
    validates :phone_number, length: { maximum: 11 }
    validates :token
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Infomation.create(post_code: post_code, shipping_area_id: shipping_area_id, city: city, house_name: house_name, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end
