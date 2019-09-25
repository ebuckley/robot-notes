require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should 302" do
    get dashboard_show_url
    assert_response 302
  end
  test "should 200 when authenticated" do
    login_user
    get dashboard_show_url
    assert_response :success
  end
end
