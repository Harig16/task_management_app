class DashboardsController < ApplicationController

  before_action :logged_in_user, only: [:home]

  def home
    @user = User.find_by(params[:id])
  end
end
