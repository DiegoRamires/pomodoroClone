require 'test_helper'

class StopwatchControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get stopwatch_create_url
    assert_response :success
  end

  test "should get update" do
    get stopwatch_update_url
    assert_response :success
  end

end
