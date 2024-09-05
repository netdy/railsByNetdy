class SetpasswordController < ApplicationController
  def index
  end

  def create
    email = session[:user_email]
    password= params[:setpassword][:password]
    password_confirmation = params[:setpassword][:password_confirm]
    # puts "--------------------------------------------------------------"
    # puts "Email: #{email}"
    # puts "Password: #{password}"
    # puts "Password Confirmation: #{password_confirmation}"
    if password != password_confirmation
      # puts "--------------------------------------------------------------"
      # puts "Passwords do not match"
      render turbo_stream: turbo_stream.update("error-messages", partial: "setpassword/form_errors", locals: { errors: [ "Passwords do not match" ] })
    else
      @user = UserInfo.find_by(Email: email)
      @user.update(password: password)
      # puts "--------------------------------------------------------------"
      # puts "Password updated"
      redirect_to controller: :page, action: :index
    end
  end
end
