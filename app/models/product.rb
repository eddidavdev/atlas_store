class Product < ApplicationRecord
  validates_presence_of [:name,  :image , :description, :stock, :price]
  belongs_to :brand
  has_one_attached :image
  has_rich_text :description

  def image_as_thumbnail(size = 200)
    image.variant(resize_to_fill: [nil, size]).processed
  end
end
