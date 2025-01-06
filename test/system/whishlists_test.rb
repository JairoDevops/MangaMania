require "application_system_test_case"

class WhishlistsTest < ApplicationSystemTestCase
  setup do
    @whishlist = whishlists(:one)
  end

  test "visiting the index" do
    visit whishlists_url
    assert_selector "h1", text: "Whishlists"
  end

  test "should create whishlist" do
    visit whishlists_url
    click_on "New whishlist"

    fill_in "Product", with: @whishlist.product_id
    fill_in "Total", with: @whishlist.total
    fill_in "User", with: @whishlist.user_id
    click_on "Create Whishlist"

    assert_text "Whishlist was successfully created"
    click_on "Back"
  end

  test "should update Whishlist" do
    visit whishlist_url(@whishlist)
    click_on "Edit this whishlist", match: :first

    fill_in "Product", with: @whishlist.product_id
    fill_in "Total", with: @whishlist.total
    fill_in "User", with: @whishlist.user_id
    click_on "Update Whishlist"

    assert_text "Whishlist was successfully updated"
    click_on "Back"
  end

  test "should destroy Whishlist" do
    visit whishlist_url(@whishlist)
    click_on "Destroy this whishlist", match: :first

    assert_text "Whishlist was successfully destroyed"
  end
end
