class Brand < ApplicationRecord
  validates_presence_of :name
  has_one_attached :image
  has_rich_text :description
  belongs_to :user
  has_many :products

  def image_as_thumbnail(width = 225, height = 225)
    image.variant(resize_to_fill: [nil, height]).processed
  end
end
