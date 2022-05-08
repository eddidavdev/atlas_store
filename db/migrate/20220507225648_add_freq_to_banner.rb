class AddFreqToBanner < ActiveRecord::Migration[7.0]
  def change
    add_column :banners, :freq, :integer
  end
end
