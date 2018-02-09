class SubtaskController < ApplicationController
  before_action :set_users
  def new
    @form = SubtaskForm.new
    flash[:task_id] = params[:task_id]
  end

  def create
    subtask = params[:subtask_form]
    task_id = flash[:task_id]
    TaskListRepository.new.create_subtask(subtask[:task_name], subtask[:status], subtask[:is_deleted], subtask[:developer_id], task_id)
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