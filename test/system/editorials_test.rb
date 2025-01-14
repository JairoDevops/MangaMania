require "application_system_test_case"

class EditorialsTest < ApplicationSystemTestCase
  setup do
    @editorial = editorials(:one)
  end

  test "visiting the index" do
    visit editorials_url
    assert_selector "h1", text: "Editorials"
  end

  test "should create editorial" do
    visit editorials_url
    click_on "New editorial"

    fill_in "Name", with: @editorial.name
    click_on "Create Editorial"

    assert_text "Editorial was successfully created"
    click_on "Back"
  end

  test "should update Editorial" do
    visit editorial_url(@editorial)
    click_on "Edit this editorial", match: :first

    fill_in "Name", with: @editorial.name
    click_on "Update Editorial"

    assert_text "Editorial was successfully updated"
    click_on "Back"
  end

  test "should destroy Editorial" do
    visit editorial_url(@editorial)
    click_on "Destroy this editorial", match: :first

    assert_text "Editorial was successfully destroyed"
  end
end
