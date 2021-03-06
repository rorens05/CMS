require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "creating a Student" do
    visit students_url
    click_on "New Student"

    fill_in "Birthday", with: @student.birthday
    fill_in "Contact no", with: @student.contact_no
    fill_in "Course", with: @student.course
    fill_in "Curriculum year", with: @student.curriculum_year
    fill_in "Email", with: @student.email
    fill_in "First name", with: @student.first_name
    fill_in "Gender", with: @student.gender
    fill_in "Last name", with: @student.last_name
    fill_in "Middle name", with: @student.middle_name
    fill_in "Student no", with: @student.student_no
    fill_in "Year", with: @student.year
    fill_in "Year enrolled", with: @student.year_enrolled
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "updating a Student" do
    visit students_url
    click_on "Edit", match: :first

    fill_in "Birthday", with: @student.birthday
    fill_in "Contact no", with: @student.contact_no
    fill_in "Course", with: @student.course
    fill_in "Curriculum year", with: @student.curriculum_year
    fill_in "Email", with: @student.email
    fill_in "First name", with: @student.first_name
    fill_in "Gender", with: @student.gender
    fill_in "Last name", with: @student.last_name
    fill_in "Middle name", with: @student.middle_name
    fill_in "Student no", with: @student.student_no
    fill_in "Year", with: @student.year
    fill_in "Year enrolled", with: @student.year_enrolled
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "destroying a Student" do
    visit students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student was successfully destroyed"
  end
end
