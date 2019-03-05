require "application_system_test_case"

class TestQuestionsTest < ApplicationSystemTestCase
  setup do
    @test_question = test_questions(:one)
  end

  test "visiting the index" do
    visit test_questions_url
    assert_selector "h1", text: "Test Questions"
  end

  test "creating a Test question" do
    visit test_questions_url
    click_on "New Test Question"

    fill_in "Answer", with: @test_question.answer
    fill_in "Question", with: @test_question.question
    fill_in "Test", with: @test_question.test_id
    click_on "Create Test question"

    assert_text "Test question was successfully created"
    click_on "Back"
  end

  test "updating a Test question" do
    visit test_questions_url
    click_on "Edit", match: :first

    fill_in "Answer", with: @test_question.answer
    fill_in "Question", with: @test_question.question
    fill_in "Test", with: @test_question.test_id
    click_on "Update Test question"

    assert_text "Test question was successfully updated"
    click_on "Back"
  end

  test "destroying a Test question" do
    visit test_questions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test question was successfully destroyed"
  end
end
