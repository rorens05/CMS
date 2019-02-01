require 'test_helper'

class UserAuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get user_authentication_login_url
    assert_response :success
  end

end
