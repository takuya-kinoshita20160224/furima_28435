class RemoveShippingAreaFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :shipping_area, :integer
  end
end
