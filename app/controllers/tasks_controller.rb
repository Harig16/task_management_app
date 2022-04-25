class TasksController < ApplicationController

  before_action :logged_in_user, only: [:create, :edit, :update]

  def create
    @task = Task.new(task_params)
    if logged_in?
      @task.user = current_user
      @task.save
      flash[:success] = "Task created successfully!"
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "Information updated successfully!!!"
      redirect_to root_url
    else
      flash[:danger] = "Invalid Information!!!"
      render 'edit'
    end
  end

  private

    def task_params
      params.require(:task).permit(:title, :status, :deadline)
    end
end
