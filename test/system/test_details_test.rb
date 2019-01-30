require "application_system_test_case"

class TestDetailsTest < ApplicationSystemTestCase
  setup do
    @test_detail = test_details(:one)
  end

  test "visiting the index" do
    visit test_details_url
    assert_selector "h1", text: "Test Details"
  end

  test "creating a Test detail" do
    visit test_details_url
    click_on "New Test Detail"

    fill_in "Description", with: @test_detail.description
    fill_in "Name", with: @test_detail.name
    click_on "Create Test detail"

    assert_text "Test detail was successfully created"
    click_on "Back"
  end

  test "updating a Test detail" do
    visit test_details_url
    click_on "Edit", match: :first

    fill_in "Description", with: @test_detail.description
    fill_in "Name", with: @test_detail.name
    click_on "Update Test detail"

    assert_text "Test detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Test detail" do
    visit test_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test detail was successfully destroyed"
  end
end
