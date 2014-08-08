class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.integer :product_category_id
      t.integer :store_id
      t.string :name
      t.string :sku
      t.text :description
      t.text :short_description
      t.decimal :price, precision: 8, scale: 2, default: 0.0
      t.integer :tax_rate_id

      t.timestamps
    end
  end
end
