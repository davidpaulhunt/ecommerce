class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|

      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :per_product_price, precision: 8, scale: 2
      t.decimal :total_item_price, precision: 8, scale: 2
      t.decimal :tax_rate, precision: 8, scale: 2
      t.decimal :tax_amount, precision: 8, scale: 2
      
      t.timestamps
    end
  end
end
