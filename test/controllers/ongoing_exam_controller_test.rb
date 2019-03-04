require 'test_helper'

class OngoingExamControllerTest < ActionDispatch::IntegrationTest
  test "should get start_exam" do
    get ongoing_exam_start_exam_url
    assert_response :success
  end

  test "should get exam" do
    get ongoing_exam_exam_url
    assert_response :success
  end

end
