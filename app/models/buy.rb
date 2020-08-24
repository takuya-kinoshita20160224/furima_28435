class Buy < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_area

  belongs_to :user
  belongs_to :item
  has_one :infomation, dependent: :destroy
end
