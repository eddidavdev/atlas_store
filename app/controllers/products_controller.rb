class ProductsController < ApplicationController
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

  def new_product_from_brand
    @product = Product.new
    @product.brand_id = params[:brand_id]
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product.brand, notice: 'product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
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

  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :price, :stock, :image, :description, :brand_id)
  end
end
