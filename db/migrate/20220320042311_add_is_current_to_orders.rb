class AddIsCurrentToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :is_current, :boolean
  end
end
