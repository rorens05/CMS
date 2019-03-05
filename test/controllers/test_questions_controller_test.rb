require 'test_helper'

class TestQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_question = test_questions(:one)
  end

  test "should get index" do
    get test_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_test_question_url
    assert_response :success
  end

  test "should create test_question" do
    assert_difference('TestQuestion.count') do
      post test_questions_url, params: { test_question: { answer: @test_question.answer, question: @test_question.question, test_id: @test_question.test_id } }
    end

    assert_redirected_to test_question_url(TestQuestion.last)
  end

  test "should show test_question" do
    get test_question_url(@test_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_question_url(@test_question)
    assert_response :success
  end

  test "should update test_question" do
    patch test_question_url(@test_question), params: { test_question: { answer: @test_question.answer, question: @test_question.question, test_id: @test_question.test_id } }
    assert_redirected_to test_question_url(@test_question)
  end

  test "should destroy test_question" do
    assert_difference('TestQuestion.count', -1) do
      delete test_question_url(@test_question)
    end

    assert_redirected_to test_questions_url
  end
end
