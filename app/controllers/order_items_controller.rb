class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[update destroy]
  def update
    if Integer(order_item_params[:quantity]) <= 0
      product = @order_item.product
      product.stock += @order_item.quantity
      product.save
      @order_item.destroy
    else
      product = @order_item.product
      product.stock += @order_item.quantity
      @order_item.update(order_item_params)
      product.stock -= @order_item.quantity
      product.save
    end
    redirect_to @order_item.order.is_current ? shopping_cart_url : edit_order_path(@order_item.order),
                notice: 'Order was successfully updated.'
  end

  def destroy
    @order_item.destroy
    redirect_to shopping_cart_url, notice: 'Order was successfully updated.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_item_params
    params.require(:order_item).permit(:quantity)
  end
end
