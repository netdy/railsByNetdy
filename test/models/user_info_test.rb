require "test_helper"

class UserInfoTest < ActiveSupport::TestCase
  def setup
    @user_info = UserInfo.new(
      FirstName: "Netdy",
      LastName: "Naja",
      DateOfBirth: "2002-05-27",
      Gender: "Female",
      Email: "john.doe@example.com",
      PhoneNumber: "0951456789",
      Subject: "Front-end"
    )
  end

  test "should be valid with valid attributes" do
    assert @user_info.valid?
  end

  test "should not be valid without a first name" do
    @user_info.FirstName = nil
    assert_not @user_info.valid?
  end

  test "should not be valid without a last name" do
    @user_info.LastName = nil
    assert_not @user_info.valid?
  end

  test "should not be valid without a date of birth" do
    @user_info.DateOfBirth = nil
    assert_not @user_info.valid?
  end

  test "should not be valid without a gender" do
    @user_info.Gender = nil
    assert_not @user_info.valid?
  end

  test "should not be valid with an invalid gender" do
    @user_info.Gender = "Non-binary"
    assert_not @user_info.valid?
  end

  test "should not be valid without an email" do
    @user_info.Email = nil
    assert_not @user_info.valid?
  end

  test "should not be valid with a duplicate email" do
    duplicate_user_info = @user_info.dup
    @user_info.save
    assert_not duplicate_user_info.valid?
  end

  test "should not be valid with an invalid email format" do
    @user_info.Email = "invalid_email"
    assert_not @user_info.valid?
  end

  test "should not be valid without a phone number" do
    @user_info.PhoneNumber = nil
    assert_not @user_info.valid?
  end

  test "should not be valid with an invalid phone number format" do
    @user_info.PhoneNumber = "12345"
    assert_not @user_info.valid?
  end

  test "should not be valid without a subject" do
    @user_info.Subject = nil
    assert_not @user_info.valid?
  end
end
