require 'test_helper'

class TestAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_answer = test_answers(:one)
  end

  test "should get index" do
    get test_answers_url
    assert_response :success
  end

  test "should get new" do
    get new_test_answer_url
    assert_response :success
  end

  test "should create test_answer" do
    assert_difference('TestAnswer.count') do
      post test_answers_url, params: { test_answer: { answer: @test_answer.answer, check: @test_answer.check, test_question_id: @test_answer.test_question_id, test_result_id: @test_answer.test_result_id } }
    end

    assert_redirected_to test_answer_url(TestAnswer.last)
  end

  test "should show test_answer" do
    get test_answer_url(@test_answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_answer_url(@test_answer)
    assert_response :success
  end

  test "should update test_answer" do
    patch test_answer_url(@test_answer), params: { test_answer: { answer: @test_answer.answer, check: @test_answer.check, test_question_id: @test_answer.test_question_id, test_result_id: @test_answer.test_result_id } }
    assert_redirected_to test_answer_url(@test_answer)
  end

  test "should destroy test_answer" do
    assert_difference('TestAnswer.count', -1) do
      delete test_answer_url(@test_answer)
    end

    assert_redirected_to test_answers_url
  end
end
