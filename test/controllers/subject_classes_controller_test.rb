require 'test_helper'

class SubjectClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject_class = subject_classes(:one)
  end

  test "should get index" do
    get subject_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_subject_class_url
    assert_response :success
  end

  test "should create subject_class" do
    assert_difference('SubjectClass.count') do
      post subject_classes_url, params: { subject_class: { block: @subject_class.block, days: @subject_class.days, end_time: @subject_class.end_time, instructor_id: @subject_class.instructor_id, school_year: @subject_class.school_year, start_time: @subject_class.start_time, subject_id: @subject_class.subject_id } }
    end

    assert_redirected_to subject_class_url(SubjectClass.last)
  end

  test "should show subject_class" do
    get subject_class_url(@subject_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_subject_class_url(@subject_class)
    assert_response :success
  end

  test "should update subject_class" do
    patch subject_class_url(@subject_class), params: { subject_class: { block: @subject_class.block, days: @subject_class.days, end_time: @subject_class.end_time, instructor_id: @subject_class.instructor_id, school_year: @subject_class.school_year, start_time: @subject_class.start_time, subject_id: @subject_class.subject_id } }
    assert_redirected_to subject_class_url(@subject_class)
  end

  test "should destroy subject_class" do
    assert_difference('SubjectClass.count', -1) do
      delete subject_class_url(@subject_class)
    end

    assert_redirected_to subject_classes_url
  end
end
