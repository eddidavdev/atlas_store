class Brand < ApplicationRecord
  validates_presence_of :name
  has_one_attached :image
  has_rich_text :description
  belongs_to :user
  has_many :products

  def image_as_thumbnail(size = 300)
    image.variant(resize_to_fit: [nil, size]).processed
  end
end
