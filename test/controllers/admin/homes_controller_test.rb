require "test_helper"

class Admin::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get admin_homes_home_url
    assert_response :success
  end

  test "should get about" do
    get admin_homes_about_url
    assert_response :success
  end
end
