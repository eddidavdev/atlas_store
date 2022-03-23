class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :name
      t.decimal :percent
      t.datetime :expiration_date

      t.timestamps
    end
  end
end
