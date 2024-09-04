class LoginController < ApplicationController
  def index
  end

  def create
    email = params[:login][:Email]
    phone_number = params[:login][:PhoneNumber]
    puts "--------------------------------------------------------------"
    puts "Email: #{email}"
    puts "Phone Number: #{phone_number}"
    @user = UserInfo.find_by(Email: email, PhoneNumber: phone_number)
    if @user
      puts "--------------------------------------------------------------"
      puts "User found"
    else
      puts "--------------------------------------------------------------"
      puts "User not found"
    end
  end
end
