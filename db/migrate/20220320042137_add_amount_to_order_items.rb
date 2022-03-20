class AddAmountToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :amount, :integer
  end
end
