class AddTypeToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :type, :integer, default: 0
  end
end
