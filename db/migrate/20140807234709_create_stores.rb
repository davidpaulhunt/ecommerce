class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :user_id
      t.string :web_url

      t.timestamps
    end
  end
end
