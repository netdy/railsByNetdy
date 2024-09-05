class LoginController < ApplicationController
  def index
  end

  def create
    email = params[:login][:Email]
    phone_number = params[:login][:PhoneNumber]
    puts "--------------------------------------------------------------"
    puts "Email: #{email}"
    puts "Phone Number: #{phone_number}"
    @user = UserInfo.find_by(Email: email, password: phone_number)
    @user_first = UserInfo.find_by(Email: email, PhoneNumber: phone_number)
    if @user
      session[:user_email] = @user_first.Email
      puts "Session set: #{session[:user_email]}"
      puts "--------------------------------------------------------------"
      puts "User found"
      redirect_to controller: :page, action: :index
    else
      if @user_first
        session[:user_email] = @user_first.Email
        puts "Session set: #{session[:user_email]}"
        puts "--------------------------------------------------------------"
        puts "User found"
        redirect_to controller: :setpassword, action: :index
      else
        puts "--------------------------------------------------------------"
        puts "User not found"
        render turbo_stream: turbo_stream.update("error-messages", partial: "login/form_errors", locals: { errors: [ "invalid user or password" ] })
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
