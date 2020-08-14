class RemoveShippingDateFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :shipping_date, :integer
  end
end
