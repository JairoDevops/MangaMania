require "test_helper"

class WhishlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @whishlist = whishlists(:one)
  end

  test "should get index" do
    get whishlists_url
    assert_response :success
  end

  test "should get new" do
    get new_whishlist_url
    assert_response :success
  end

  test "should create whishlist" do
    assert_difference("Whishlist.count") do
      post whishlists_url, params: { whishlist: { product_id: @whishlist.product_id, total: @whishlist.total, user_id: @whishlist.user_id } }
    end

    assert_redirected_to whishlist_url(Whishlist.last)
  end

  test "should show whishlist" do
    get whishlist_url(@whishlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_whishlist_url(@whishlist)
    assert_response :success
  end

  test "should update whishlist" do
    patch whishlist_url(@whishlist), params: { whishlist: { product_id: @whishlist.product_id, total: @whishlist.total, user_id: @whishlist.user_id } }
    assert_redirected_to whishlist_url(@whishlist)
  end

  test "should destroy whishlist" do
    assert_difference("Whishlist.count", -1) do
      delete whishlist_url(@whishlist)
    end

    assert_redirected_to whishlists_url
  end
end
