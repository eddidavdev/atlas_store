class Brand < ApplicationRecord
  validates_presence_of :name
  has_one_attached :image
  has_rich_text :description
  belongs_to :user
  has_many :products

  def image_as_thumbnail
    image.variant(resize_to_limit: [300, 300]).processed
  end
end
