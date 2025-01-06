require "application_system_test_case"

class WhislistsTest < ApplicationSystemTestCase
  setup do
    @whislist = whislists(:one)
  end

  test "visiting the index" do
    visit whislists_url
    assert_selector "h1", text: "Whislists"
  end

  test "should create whislist" do
    visit whislists_url
    click_on "New whislist"

    fill_in "Product", with: @whislist.product_id
    fill_in "Total", with: @whislist.total
    fill_in "User", with: @whislist.user_id
    click_on "Create Whislist"

    assert_text "Whislist was successfully created"
    click_on "Back"
  end

  test "should update Whislist" do
    visit whislist_url(@whislist)
    click_on "Edit this whislist", match: :first

    fill_in "Product", with: @whislist.product_id
    fill_in "Total", with: @whislist.total
    fill_in "User", with: @whislist.user_id
    click_on "Update Whislist"

    assert_text "Whislist was successfully updated"
    click_on "Back"
  end

  test "should destroy Whislist" do
    visit whislist_url(@whislist)
    click_on "Destroy this whislist", match: :first

    assert_text "Whislist was successfully destroyed"
  end
end
