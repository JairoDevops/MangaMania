require "application_system_test_case"

class ShopingcarsTest < ApplicationSystemTestCase
  setup do
    @shopingcar = shopingcars(:one)
  end

  test "visiting the index" do
    visit shopingcars_url
    assert_selector "h1", text: "Shopingcars"
  end

  test "should create shopingcar" do
    visit shopingcars_url
    click_on "New shopingcar"

    fill_in "Product", with: @shopingcar.product_id
    fill_in "Total", with: @shopingcar.total
    fill_in "User", with: @shopingcar.user_id
    click_on "Create Shopingcar"

    assert_text "Shopingcar was successfully created"
    click_on "Back"
  end

  test "should update Shopingcar" do
    visit shopingcar_url(@shopingcar)
    click_on "Edit this shopingcar", match: :first

    fill_in "Product", with: @shopingcar.product_id
    fill_in "Total", with: @shopingcar.total
    fill_in "User", with: @shopingcar.user_id
    click_on "Update Shopingcar"

    assert_text "Shopingcar was successfully updated"
    click_on "Back"
  end

  test "should destroy Shopingcar" do
    visit shopingcar_url(@shopingcar)
    click_on "Destroy this shopingcar", match: :first

    assert_text "Shopingcar was successfully destroyed"
  end
end
