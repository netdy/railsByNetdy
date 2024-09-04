class PageController < ApplicationController
  before_action :authenticate_user

  def index
    @user = UserInfo.all
    @current_date = params[:date] ? Date.parse(params[:date]) : Date.today
    @users = UserInfo.where.not(password: [ nil, "" ]).to_a
    @birthdays = {}
    @users.each do |user|
      if user.DateOfBirth.present?
        date_key = user.DateOfBirth.strftime("%m-%d")
        @birthdays[date_key] ||= []
        @birthdays[date_key] << user
      end
    end
  end

  def update_calendar
    @current_date = Date.parse(params[:date])
    @users = UserInfo.where.not(password: [ nil, "" ]).to_a
    @birthdays = {}
    @users.each do |user|
      if user.DateOfBirth.present?
        date_key = user.DateOfBirth.strftime("%m-%d")
        @birthdays[date_key] ||= []
        @birthdays[date_key] << user
      end
    end

    respond_to do |format|
      format.turbo_stream
    end
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
