class LoginController < ApplicationController
  def index
  end

  def create
    email = params[:login][:Email]
    phone_number = params[:login][:PhoneNumber]
    puts "--------------------------------------------------------------"
    puts "Email: #{email}"
    puts "Phone Number: #{phone_number}"
  end
end
