class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :billing_address1
      t.string :billing_address2
      t.string :billing_city
      t.string :billing_state
      t.string :billing_zipcode
      t.integer :billing_country_id
      t.string :email_address
      t.datetime :recieved_at
      t.datetime :accepted_at
      t.datetime :shipped_at
      t.string :ip_address
      t.text :notes
      t.boolean :separate_shipping_address, default: false
      t.string :delivery_address1
      t.string :delivery_address2
      t.string :delivery_city
      t.string :delivery_state
      t.string :delivery_zipcode
      t.integer :delivery_country_id
      t.decimal :amount_paid, precision: 8, scale: 2, default: 0.0

      t.integer :store_id

      t.timestamps
    end
  end
end
