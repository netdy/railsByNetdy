class LoginController < ApplicationController
  def index
  end

  def create
    email = params[:login][:Email]
    phone_number = params[:login][:PhoneNumber]
    password = params[:login][:PhoneNumber]
    
    @user = UserInfo.find_by(Email: email, password: password)
    if @user
      session[:user_email] = @user.Email
      redirect_to controller: :page, action: :index
    else
      @user_first = UserInfo.find_by(Email: email, PhoneNumber: phone_number)
      if @user_first
        if @user_first.password.blank?
          session[:user_email] = @user_first.Email
          redirect_to controller: :setpassword, action: :index
        else
          render turbo_stream: turbo_stream.update("error-messages", partial: "login/form_errors", locals: { errors: ["Invalid user or password"] })
        end
      else
        render turbo_stream: turbo_stream.update("error-messages", partial: "login/form_errors", locals: { errors: ["Invalid user or password"] })
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
