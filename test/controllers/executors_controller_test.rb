require "test_helper"

class ExecutorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get executors_index_url
    assert_response :success
  end
end
