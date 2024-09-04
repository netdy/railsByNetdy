class PageController < ApplicationController
  before_action :authenticate_user

  def index
  end

  def authenticate_user
    if session[:user_email].present?
      puts "--------------------------------------------------------------"
      puts "Session found: #{session[:user_email]}"
    else
      puts "--------------------------------------------------------------"
      puts "Session not found"
      redirect_to controller: :login, action: :index
    end
  end
end
