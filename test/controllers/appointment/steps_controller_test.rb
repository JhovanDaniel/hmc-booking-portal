require "test_helper"

class Appointment::StepsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get appointment_steps_show_url
    assert_response :success
  end

  test "should get update" do
    get appointment_steps_update_url
    assert_response :success
  end
end
