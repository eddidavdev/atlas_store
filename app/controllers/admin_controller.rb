class AdminController < ApplicationController
  def index; end

  def brands
    @brands = Brand.all
  end

  def products
    @products = Product.all
  end

  def discounts
    @discounts = Discount.all
  end

  def orders
    @orders = Order.all
  end

  def users
    @users = User.all
  end

  def profiles
    @profiles = Profile.all
  end
end
