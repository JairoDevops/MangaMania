require "application_system_test_case"

class CarshoppingsTest < ApplicationSystemTestCase
  setup do
    @carshopping = carshoppings(:one)
  end

  test "visiting the index" do
    visit carshoppings_url
    assert_selector "h1", text: "Carshoppings"
  end

  test "should create carshopping" do
    visit carshoppings_url
    click_on "New carshopping"

    fill_in "Product", with: @carshopping.product_id
    fill_in "Total", with: @carshopping.total
    fill_in "User", with: @carshopping.user_id
    click_on "Create Carshopping"

    assert_text "Carshopping was successfully created"
    click_on "Back"
  end

  test "should update Carshopping" do
    visit carshopping_url(@carshopping)
    click_on "Edit this carshopping", match: :first

    fill_in "Product", with: @carshopping.product_id
    fill_in "Total", with: @carshopping.total
    fill_in "User", with: @carshopping.user_id
    click_on "Update Carshopping"

    assert_text "Carshopping was successfully updated"
    click_on "Back"
  end

  test "should destroy Carshopping" do
    visit carshopping_url(@carshopping)
    click_on "Destroy this carshopping", match: :first

    assert_text "Carshopping was successfully destroyed"
  end
end
