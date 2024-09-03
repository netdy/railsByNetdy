class RegistrationController < ApplicationController
  def index
  end

  def create
    puts "--------------------------------------------------------------"
    @user_info = UserInfo.new(user_info_params)
    if @user_info.save
      puts "--------------------------------------------------------------"
      puts "User info saved"
    else
      puts "--------------------------------------------------------------"
      puts "User info not saved"
    end
  end

  private
  def user_info_params
    params.require(:user_info).permit(:FirstName, :LastName, :DateOfBirth, :Gender, :Email, :PhoneNumber, :Subject)
  end
end
