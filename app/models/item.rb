class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date

  belongs_to :user
  has_one :buy
  has_one_attached :image

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :shipping_date_id, numericality: { other_than: 1 }
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
end
