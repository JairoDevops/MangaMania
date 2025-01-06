require "test_helper"

class CarshoppingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carshopping = carshoppings(:one)
  end

  test "should get index" do
    get carshoppings_url
    assert_response :success
  end

  test "should get new" do
    get new_carshopping_url
    assert_response :success
  end

  test "should create carshopping" do
    assert_difference("Carshopping.count") do
      post carshoppings_url, params: { carshopping: { product_id: @carshopping.product_id, total: @carshopping.total, user_id: @carshopping.user_id } }
    end

    assert_redirected_to carshopping_url(Carshopping.last)
  end

  test "should show carshopping" do
    get carshopping_url(@carshopping)
    assert_response :success
  end

  test "should get edit" do
    get edit_carshopping_url(@carshopping)
    assert_response :success
  end

  test "should update carshopping" do
    patch carshopping_url(@carshopping), params: { carshopping: { product_id: @carshopping.product_id, total: @carshopping.total, user_id: @carshopping.user_id } }
    assert_redirected_to carshopping_url(@carshopping)
  end

  test "should destroy carshopping" do
    assert_difference("Carshopping.count", -1) do
      delete carshopping_url(@carshopping)
    end

    assert_redirected_to carshoppings_url
  end
end
