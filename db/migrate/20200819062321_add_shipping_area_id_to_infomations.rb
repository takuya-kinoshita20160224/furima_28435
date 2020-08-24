class AddShippingAreaIdToInfomations < ActiveRecord::Migration[6.0]
  def change
    add_column :infomations, :shipping_area_id, :integer
  end
end
