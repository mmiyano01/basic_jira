class TaskController < ApplicationController
  before_action :set_users
  def new
    @form = TaskForm.new
  end

  def create
    task = params[:task_form]
    TaskListRepository.new.create_task(task[:task_name], task[:status], task[:is_deleted], task[:developer_id])
    redirect_to root_path
  end

  def status_update
    task = Task.find(params[:id])
    TaskListRepository.new.status_update(task)
    redirect_to root_path
  end

  def delete
    task = Task.find(params[:id])
    TaskListRepository.new.delete(task)
    redirect_to root_path
  end

  def set_users
    @users = UserRepository.new.find_all
  end
end