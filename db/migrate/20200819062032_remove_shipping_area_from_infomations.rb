class RemoveShippingAreaFromInfomations < ActiveRecord::Migration[6.0]
  def change
    remove_column :infomations, :shipping_area, :integer
  end
end
