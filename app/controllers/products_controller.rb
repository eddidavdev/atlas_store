class ProductsController < ApplicationController
  before_action :set_brand

  def index
    @products = Product.all
  end

  def create
    @brand.products.create! params.required(:product).permit(:name, :price, :stock, :image, :description)
    redirect_to @brand
  end

  private

  def set_brand
    @brand = Brand.find(params[:brand_id])
  end
end
