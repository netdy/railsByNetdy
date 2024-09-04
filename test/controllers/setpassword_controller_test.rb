require "test_helper"

class SetpasswordControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get setpassword_index_url
    assert_response :success
  end
end
