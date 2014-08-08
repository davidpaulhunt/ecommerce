class ChangeColNameOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :recieved_at
    add_column :orders, :received_at, :datetime
  end
end
