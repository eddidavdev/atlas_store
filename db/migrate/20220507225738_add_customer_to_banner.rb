class AddCustomerToBanner < ActiveRecord::Migration[7.0]
  def change
    add_column :banners, :customer, :string
  end
end
