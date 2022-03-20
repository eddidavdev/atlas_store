class Product < ApplicationRecord
  belongs_to :brand
  has_one_attached :image
  has_rich_text :description

  def image_as_thumbnail
    image.variant(resize_to_limit: [200, 200]).processed
  end
end
