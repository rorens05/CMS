require "application_system_test_case"

class TestsTest < ApplicationSystemTestCase
  setup do
    @test = tests(:one)
  end

  test "visiting the index" do
    visit tests_url
    assert_selector "h1", text: "Tests"
  end

  test "creating a Test" do
    visit tests_url
    click_on "New Test"

    fill_in "Is online", with: @test.is_online
    fill_in "Name", with: @test.name
    fill_in "No of items", with: @test.no_of_items
    fill_in "Schedule", with: @test.schedule
    fill_in "Subject class", with: @test.subject_class_id
    fill_in "Test type", with: @test.test_type_id
    click_on "Create Test"

    assert_text "Test was successfully created"
    click_on "Back"
  end

  test "updating a Test" do
    visit tests_url
    click_on "Edit", match: :first

    fill_in "Is online", with: @test.is_online
    fill_in "Name", with: @test.name
    fill_in "No of items", with: @test.no_of_items
    fill_in "Schedule", with: @test.schedule
    fill_in "Subject class", with: @test.subject_class_id
    fill_in "Test type", with: @test.test_type_id
    click_on "Update Test"

    assert_text "Test was successfully updated"
    click_on "Back"
  end

  test "destroying a Test" do
    visit tests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test was successfully destroyed"
  end
end
