require "test_helper"

class WhislistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @whislist = whislists(:one)
  end

  test "should get index" do
    get whislists_url
    assert_response :success
  end

  test "should get new" do
    get new_whislist_url
    assert_response :success
  end

  test "should create whislist" do
    assert_difference("Whislist.count") do
      post whislists_url, params: { whislist: { product_id: @whislist.product_id, total: @whislist.total, user_id: @whislist.user_id } }
    end

    assert_redirected_to whislist_url(Whislist.last)
  end

  test "should show whislist" do
    get whislist_url(@whislist)
    assert_response :success
  end

  test "should get edit" do
    get edit_whislist_url(@whislist)
    assert_response :success
  end

  test "should update whislist" do
    patch whislist_url(@whislist), params: { whislist: { product_id: @whislist.product_id, total: @whislist.total, user_id: @whislist.user_id } }
    assert_redirected_to whislist_url(@whislist)
  end

  test "should destroy whislist" do
    assert_difference("Whislist.count", -1) do
      delete whislist_url(@whislist)
    end

    assert_redirected_to whislists_url
  end
end
