class CreateShippingDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_details do |t|
      t.references :purchase, null: false, foreign_key: true
      t.string :postal_code
      t.integer :prefecture_id
      t.string :city_or_district
      t.string :street_address
      t.string :building_name
      t.string :phone_number
      t.timestamps
    end
  end
end
