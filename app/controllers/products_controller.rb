class ProductsController < ApplicationController
  before_action :set_brand, only: %i[create]
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  # GET /discounts/1 or /discounts/1.json
  def show; end

  # GET /discounts/new
  def new
    @product = Product.new
    @brands = Brand.find_by(user_id: current_user.id)
  end

  # GET /discounts/1/edit
  def edit; end

  def create
    @brand.products.create! params.required(:product).permit(:name, :price, :stock, :image, :description)
    redirect_to @brand
  end

  # PATCH/PUT /discounts/1 or /discounts/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to brand_url(@product.brand), notice: 'Product was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def set_brand
    @brand = Brand.find(params[:brand_id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :price, :stock, :image, :description)
  end
end
