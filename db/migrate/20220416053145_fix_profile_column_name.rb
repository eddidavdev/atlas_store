class FixProfileColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :profiles, :type, :client_type
  end
end
