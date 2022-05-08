class AdminController < ApplicationController
  def index; end

  def brands
    @brands = Brand.all
    @current_page = 'Brand'
  end

  def products
    @products = Product.all
    @current_page = 'Product'
  end

  def discounts
    @discounts = Discount.all
    @current_page = 'Discount'
  end

  def orders
    @orders = Order.where(is_current: false)
    @current_page = 'Order'
  end

  def users
    @users = User.all
    @current_page = 'User'
  end

  def profiles
    @profiles = Profile.all
    @current_page = 'Profile'
  end

  def categories
    @categories = Category.all
    @current_page = 'Category'
  end

  def banners
    @banners = Banner.all
    @current_page = 'Banner'
  end
end
