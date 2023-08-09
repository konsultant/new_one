require "test_helper"

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get customers_create_url
    assert_response :success
  end
end
