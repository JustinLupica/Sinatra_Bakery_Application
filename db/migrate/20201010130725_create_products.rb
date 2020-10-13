class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_category
      t.string :product_flavor
      t.string :product_size
      t.integer :quantity
    end
  end
end
