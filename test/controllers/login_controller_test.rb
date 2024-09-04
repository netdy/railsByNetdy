require "test_helper"

class LoginControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = user_infos(:one)  # Assuming you have a fixture for UserInfo
    @user.update(password: "password123")  # Set a password for testing
  end

  test "should get index" do
    get login_index_path
    assert_response :success
  end

  test "should redirect to set password for existing user without password" do
    @user.update(password: nil)
    post login_path, params: { login: { Email: @user.Email, PhoneNumber: @user.PhoneNumber } }
    assert_redirected_to setpassword_index_path
    assert_equal @user.Email, session[:user_email]
  end

  test "should render error for non-existent user" do
    post login_path, params: { login: { Email: "nonexistent@example.com", PhoneNumber: "1234567890" } }
    assert_response :success  # Because we're rendering a Turbo Stream
    assert_match "User not found", response.body
  end
end
