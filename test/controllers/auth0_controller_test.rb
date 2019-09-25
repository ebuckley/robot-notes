require 'test_helper'

class Auth0ControllerTest < ActionDispatch::IntegrationTest
  test "the redirect logic" do
    get auth_auth0_callback_url
    assert_redirected_to dashboard_url
    assert_not_nil session[:userinfo]
  end
end
