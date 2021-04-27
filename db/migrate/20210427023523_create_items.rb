class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.integer :category_id
      t.integer :status_id
      t.integer :deli_price_id
      t.integer :area_id
      t.integer :deli_day_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
