require "application_system_test_case"

class AddresTest < ApplicationSystemTestCase
  setup do
    @addre = addres(:one)
  end

  test "visiting the index" do
    visit addres_url
    assert_selector "h1", text: "Addres"
  end

  test "should create addre" do
    visit addres_url
    click_on "New addre"

    fill_in "Addres", with: @addre.addres
    fill_in "User", with: @addre.user_id
    click_on "Create Addre"

    assert_text "Addre was successfully created"
    click_on "Back"
  end

  test "should update Addre" do
    visit addre_url(@addre)
    click_on "Edit this addre", match: :first

    fill_in "Addres", with: @addre.addres
    fill_in "User", with: @addre.user_id
    click_on "Update Addre"

    assert_text "Addre was successfully updated"
    click_on "Back"
  end

  test "should destroy Addre" do
    visit addre_url(@addre)
    click_on "Destroy this addre", match: :first

    assert_text "Addre was successfully destroyed"
  end
end
