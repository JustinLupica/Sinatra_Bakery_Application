class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :product_ordered
      t.timestamps
    end
  end
end
