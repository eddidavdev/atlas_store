class Brand < ApplicationRecord
  validates_presence_of [:name,  :image , :description]
  has_one_attached :image
  has_rich_text :description
  belongs_to :user
  has_many :products

  def image_as_thumbnail(size = 225)
    image.variant(resize_to_fill: [nil, size]).processed
  end
end
