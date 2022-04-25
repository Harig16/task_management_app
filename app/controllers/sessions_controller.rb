class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      #action
      log_in @user
      remember @user
      flash[:info] = "Logged in successfully!"
      redirect_to root_url
    else
      flash[:danger] = "Invalid username and password."
      render 'new'
    end
  end
end
