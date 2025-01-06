require "test_helper"

class ShopingcarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shopingcar = shopingcars(:one)
  end

  test "should get index" do
    get shopingcars_url
    assert_response :success
  end

  test "should get new" do
    get new_shopingcar_url
    assert_response :success
  end

  test "should create shopingcar" do
    assert_difference("Shopingcar.count") do
      post shopingcars_url, params: { shopingcar: { product_id: @shopingcar.product_id, total: @shopingcar.total, user_id: @shopingcar.user_id } }
    end

    assert_redirected_to shopingcar_url(Shopingcar.last)
  end

  test "should show shopingcar" do
    get shopingcar_url(@shopingcar)
    assert_response :success
  end

  test "should get edit" do
    get edit_shopingcar_url(@shopingcar)
    assert_response :success
  end

  test "should update shopingcar" do
    patch shopingcar_url(@shopingcar), params: { shopingcar: { product_id: @shopingcar.product_id, total: @shopingcar.total, user_id: @shopingcar.user_id } }
    assert_redirected_to shopingcar_url(@shopingcar)
  end

  test "should destroy shopingcar" do
    assert_difference("Shopingcar.count", -1) do
      delete shopingcar_url(@shopingcar)
    end

    assert_redirected_to shopingcars_url
  end
end
