class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  def subtotal
    order_items.inject(0) { |sum, item| sum + item.product.price * item.quantity }
  end
end
