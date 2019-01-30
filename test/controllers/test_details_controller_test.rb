require 'test_helper'

class TestDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_detail = test_details(:one)
  end

  test "should get index" do
    get test_details_url
    assert_response :success
  end

  test "should get new" do
    get new_test_detail_url
    assert_response :success
  end

  test "should create test_detail" do
    assert_difference('TestDetail.count') do
      post test_details_url, params: { test_detail: { description: @test_detail.description, name: @test_detail.name } }
    end

    assert_redirected_to test_detail_url(TestDetail.last)
  end

  test "should show test_detail" do
    get test_detail_url(@test_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_detail_url(@test_detail)
    assert_response :success
  end

  test "should update test_detail" do
    patch test_detail_url(@test_detail), params: { test_detail: { description: @test_detail.description, name: @test_detail.name } }
    assert_redirected_to test_detail_url(@test_detail)
  end

  test "should destroy test_detail" do
    assert_difference('TestDetail.count', -1) do
      delete test_detail_url(@test_detail)
    end

    assert_redirected_to test_details_url
  end
end
