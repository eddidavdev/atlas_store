class AddDetailsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :description, :text
    add_column :orders, :phone, :string
    add_column :orders, :email, :string
    add_column :orders, :address, :string
  end
end
