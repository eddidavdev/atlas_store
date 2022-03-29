class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_order

  def current
    @order = @current_order
  end

  def add_to_cart
    @current_order.order_items.create(params.permit(:product_id, :quantity))
    redirect_to shopping_cart_url, notice: 'Order was successfully updated.'
  end

  private

  def set_current_order
    @current_order = Order.first_or_create(user_id: current_user.id, status: 'open', is_current: true)
  end
end
