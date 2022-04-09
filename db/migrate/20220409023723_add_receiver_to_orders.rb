class AddReceiverToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :receiver, :string
  end
end
