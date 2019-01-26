require "application_system_test_case"

class SubjectClassesTest < ApplicationSystemTestCase
  setup do
    @subject_class = subject_classes(:one)
  end

  test "visiting the index" do
    visit subject_classes_url
    assert_selector "h1", text: "Subject Classes"
  end

  test "creating a Subject class" do
    visit subject_classes_url
    click_on "New Subject Class"

    fill_in "Block", with: @subject_class.block
    fill_in "Days", with: @subject_class.days
    fill_in "End time", with: @subject_class.end_time
    fill_in "Instructor", with: @subject_class.instructor_id
    fill_in "School year", with: @subject_class.school_year
    fill_in "Start time", with: @subject_class.start_time
    fill_in "Subject", with: @subject_class.subject_id
    click_on "Create Subject class"

    assert_text "Subject class was successfully created"
    click_on "Back"
  end

  test "updating a Subject class" do
    visit subject_classes_url
    click_on "Edit", match: :first

    fill_in "Block", with: @subject_class.block
    fill_in "Days", with: @subject_class.days
    fill_in "End time", with: @subject_class.end_time
    fill_in "Instructor", with: @subject_class.instructor_id
    fill_in "School year", with: @subject_class.school_year
    fill_in "Start time", with: @subject_class.start_time
    fill_in "Subject", with: @subject_class.subject_id
    click_on "Update Subject class"

    assert_text "Subject class was successfully updated"
    click_on "Back"
  end

  test "destroying a Subject class" do
    visit subject_classes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subject class was successfully destroyed"
  end
end
