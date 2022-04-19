class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  broadcasts_to :product
end
