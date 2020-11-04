class ChangeColumnNameInOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :product_ordered, :product_id
  end
end
