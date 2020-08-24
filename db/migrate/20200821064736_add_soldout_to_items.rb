class AddSoldoutToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :soldout, :boolean, default: false, null: false
  end
end
