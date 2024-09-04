require 'test_helper'

class SetpasswordControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = user_infos(:one)  # Assuming you have a fixture for UserInfo
  end

  test "should get index" do
    get setpassword_index_url
    assert_response :success
  end

  test "should update password when passwords match" do
    post setpassword_url, params: { setpassword: { password: 'newpassword', password_confirm: 'newpassword' } }, as: :json
    assert_redirected_to page_index_path
    @user.reload
    assert_equal 'newpassword', @user.password  # Note: In a real app, you'd check the hashed password
  end

  test "should not update password when passwords don't match" do
    post setpassword_url, params: { setpassword: { password: 'newpassword', password_confirm: 'differentpassword' } }, as: :json
    assert_response :success  # Because we're rendering a Turbo Stream
    assert_match 'Passwords do not match', response.body
    @user.reload
    assert_not_equal 'newpassword', @user.password
  end

  test "should handle missing user email in session" do
    post setpassword_url, params: { setpassword: { password: 'newpassword', password_confirm: 'newpassword' } }, as: :json
    assert_response :unprocessable_entity  # Or whatever response you decide for this case
  end

  private

  def login(user)
    post login_url, params: { user: { email: user.email, password: 'password' } }
  end
end
