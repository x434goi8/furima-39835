class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.string :product_name, null: false
      t.text :product_description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_fee_responsibility_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :shipping_duration_id, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
