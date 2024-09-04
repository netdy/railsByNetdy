require 'test_helper'
require 'mocha/minitest'

class SetpasswordControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = UserInfo.create!(
      Email: 'test@example.com',
      FirstName: 'John',
      LastName: 'Doe',
      DateOfBirth: Date.new(1990, 1, 1),
      Gender: 'Male',
      PhoneNumber: '1234567890',
      Subject: 'Math'
    )
  end

  test "should not update password when passwords don't match" do
    mock_session_for(@user)
    post setpassword_url, params: {
      setpassword: { password: 'newpassword', password_confirm: 'differentpassword' }
    }
    assert_response :success
    assert_match 'Passwords do not match', response.body
  end


  private

  def mock_session_for(user)
    SetpasswordController.any_instance.stubs(:session).returns({ user_email: user.Email })
  end
end
