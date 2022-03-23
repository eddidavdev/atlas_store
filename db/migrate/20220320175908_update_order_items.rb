class UpdateOrderItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_items, :amount
    add_column :order_items, :true_individual_price, :decimal, default: 0.0
    add_column :order_items, :true_total_price, :decimal, default: 0.0
  end
end
