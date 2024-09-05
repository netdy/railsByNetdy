class RegistrationController < ApplicationController
  def index
    @user_info = UserInfo.new
  end

  def create
    # puts "--------------------------------------------------------------"
    @user_info = UserInfo.new(user_info_params)
    if @user_info.save
      flash[:success] = "registration success"
      redirect_to action: :index
      # puts "--------------------------------------------------------------"
      # puts "User info saved"
    else
      flash.now[:error] = "registration failed"
      # puts "--------------------------------------------------------------"
      # puts "User info not saved"
      render turbo_stream: turbo_stream.update("error-messages", partial: "registration/form_errors", locals: { errors: @user_info.errors.full_messages })
    end
  end

  private
  def user_info_params
    params.require(:user_info).permit(:FirstName, :LastName, :DateOfBirth, :Gender, :Email, :PhoneNumber, :Subject)
  end
end
