class RegistrationController < ApplicationController
  def index
    @user_info = UserInfo.new
  end

  def create
    puts "--------------------------------------------------------------"
    @user_info = UserInfo.new(user_info_params)
    if @user_info.save
      flash[:success] = "ลงทะเบียนสำเร็จ!"
      redirect_to action: :index
      puts "--------------------------------------------------------------"
      puts "User info saved"
    else
      flash.now[:error] = "เกิดข้อผิดพลาดในการลงทะเบียน: #{@user_info.errors.full_messages.join(', ')}"
      puts "--------------------------------------------------------------"
      puts "User info not saved"
    end
  end

  private
  def user_info_params
    params.require(:user_info).permit(:FirstName, :LastName, :DateOfBirth, :Gender, :Email, :PhoneNumber, :Subject)
  end
end
