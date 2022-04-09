class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_order, only: %i[current add_to_cart]

  def index
    @orders = current_user.orders.where(is_current: false)
  end

  def current
    @order = @current_order
  end

  def add_to_cart
    @current_order_item = OrderItem.where(product_id: params[:product_id], order_id: @current_order.id).first
    if @current_order_item.nil?
      @current_order.order_items.create(order_params)
    else
      @current_order_item.quantity += Integer(params[:quantity])
      @current_order_item.save
    end
    redirect_to shopping_cart_url, notice: 'Order was successfully updated.'
  end

  def update
    @order = Order.find(params[:id])
    respond_to do |format|
      if @order.update(params.require(:order).permit(:is_current, :total, :status))
        format.html { redirect_to orders_path, notice: 'Order was successfully updated.' }

      else
        format.html { render :edit, status: :unprocessable_entity }

      end
    end
  end

  private

  def set_current_order
    @current_order = Order.where(user_id: current_user.id, status: 'open', is_current: true).first
    if @current_order.nil?
      @current_order = Order.new(user_id: current_user.id, status: 'open', is_current: true)
      @current_order.user_id = current_user.id
      @current_order.save
    end
  end

  def order_params
    params.permit(:product_id, :quantity)
  end
end
