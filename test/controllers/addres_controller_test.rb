require "test_helper"

class AddresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @addre = addres(:one)
  end

  test "should get index" do
    get addres_url
    assert_response :success
  end

  test "should get new" do
    get new_addre_url
    assert_response :success
  end

  test "should create addre" do
    assert_difference("Addre.count") do
      post addres_url, params: { addre: { addres: @addre.addres, user_id: @addre.user_id } }
    end

    assert_redirected_to addre_url(Addre.last)
  end

  test "should show addre" do
    get addre_url(@addre)
    assert_response :success
  end

  test "should get edit" do
    get edit_addre_url(@addre)
    assert_response :success
  end

  test "should update addre" do
    patch addre_url(@addre), params: { addre: { addres: @addre.addres, user_id: @addre.user_id } }
    assert_redirected_to addre_url(@addre)
  end

  test "should destroy addre" do
    assert_difference("Addre.count", -1) do
      delete addre_url(@addre)
    end

    assert_redirected_to addres_url
  end
end
