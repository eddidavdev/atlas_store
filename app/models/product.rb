class Product < ApplicationRecord
  validates_presence_of %i[name image description stock price]
  belongs_to :brand
  broadcasts_to :brand
  has_one_attached :image
  has_rich_text :description

  has_many :product_categories
  has_many :categories, through: :product_categories
  attr_accessor :category_elements

  def save_categories

    self.product_categories.destroy_all

    return if category_elements.nil? || category_elements.empty?

      category_elements.each do |category_id|
      ProductCategory.find_or_create_by(product: self, category_id: category_id)
    end
  end

  def image_as_thumbnail(size = 200)
    image.variant(resize_to_fill: [nil, size]).processed
  end
end
