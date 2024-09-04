require "test_helper"

class RegistrationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valid_user_info_params = {
      user_info: {
        FirstName: "John",
        LastName: "Doe",
        DateOfBirth: "2000-01-01",
        Gender: "Male",
        Email: "john.doe@example.com",
        PhoneNumber: "1234567890",
        Subject: "Front-end"
      }
    }

    @invalid_user_info_params = {
      user_info: {
        FirstName: "",
        LastName: "",
        DateOfBirth: "",
        Gender: "Unknown",
        Email: "invalid_email",
        PhoneNumber: "12345",
        Subject: ""
      }
    }
  end

  test "should get index" do
    get registration_url
    assert_response :success
    assert_select "form"
  end
end
