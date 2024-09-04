class LoginController < ApplicationController
  def index
  end

  def create
    email = params[:login][:Email]
    phone_number = params[:login][:PhoneNumber]

    # Assuming you have a User model with email and phone_number
    user = User.find_by(email: email, phone_number: phone_number)

    if user
      # Handle successful login
      flash[:success] = "Login successful!"
      redirect_to root_path # or wherever you want to redirect after login
    else
      # Handle failed login
      flash[:alert] = "Invalid email or phone number"
      render :index
    end
  end
end
