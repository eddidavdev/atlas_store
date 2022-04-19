class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_order, only: %i[current add_to_cart]
  before_action :set_order, only: %i[show edit update cancel]

  def index
    @orders = current_user.orders.where(is_current: false)
  end

  def show; end

  def edit; end

  def current
    @order = @current_order
  end

  def add_to_cart
    @current_order_item = OrderItem.where(product_id: params[:product_id], order_id: @current_order.id).first
    if @current_order_item.nil?
      @current_order.order_items.create(new_product_params)
    else
      @current_order_item.quantity += Integer(params[:quantity])
      @current_order_item.save
    end
    ammount = Integer(new_product_params[:quantity])
    product = Product.find(new_product_params[:product_id])
    product.stock -= ammount
    product.stock = 0 if product.stock.negative?
    product.save
    redirect_to shopping_cart_url, notice: 'Order was successfully updated.'
  end

  def update
    respond_to do |format|
      if @order.update(send_order_params)
        format.html { redirect_to orders_path, notice: 'Order was successfully updated.' }
      else
        format.html { redirect_back fallback_location: root_path, status: :unprocessable_entity }
      end
    end
  end

  def cancel
    @order.status = 'cancelled'

    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, notice: 'Order was successfully cancelled.' }
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_current_order
    @current_order = Order.where(user_id: current_user.id, status: 'open', is_current: true).first
    if @current_order.nil?
      @current_order = Order.new(user_id: current_user.id, status: 'open', is_current: true)
      @current_order.user_id = current_user.id
      @current_order.save
    end
  end

  def new_product_params
    params.permit(:product_id, :quantity)
  end

  def send_order_params
    params.require(:order).permit(:is_current, :total, :status, :receiver, :phone, :address, :description, :email)
  end
end
