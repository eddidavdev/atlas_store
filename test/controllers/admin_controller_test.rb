require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_index_url
    assert_response :success
  end

  test "should get brands" do
    get admin_brands_url
    assert_response :success
  end

  test "should get products" do
    get admin_products_url
    assert_response :success
  end

  test "should get discounts" do
    get admin_discounts_url
    assert_response :success
  end

  test "should get orders" do
    get admin_orders_url
    assert_response :success
  end

  test "should get users" do
    get admin_users_url
    assert_response :success
  end

  test "should get profiles" do
    get admin_profiles_url
    assert_response :success
  end
end
