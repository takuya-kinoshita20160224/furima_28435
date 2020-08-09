class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image,          null: false
      t.string :name,           null: false
      t.text :text,             null: false
      t.integer :price,         null: false
      t.integer :category,      null: false
      t.integer :status,        null: false
      t.integer :delivery_fee,  null: false
      t.integer :shipping_area, null: false
      t.integer :shipping_date, null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
