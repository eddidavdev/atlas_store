class CreateBanners < ActiveRecord::Migration[7.0]
  def change
    create_table :banners do |t|
      t.text :description
      t.string :title
      t.string :link
      t.boolean :active

      t.timestamps
    end
  end
end
