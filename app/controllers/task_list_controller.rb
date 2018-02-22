class TaskListController < ApplicationController
	before_action :set_users

	def show
		@tasks = TaskListRepository.new.find_active_tasks
	end

	def show_subtask
		@task_name = Task.find(params[:id]).task_name
		@task_id = params[:id]
		@subtasks = TaskListRepository.new.find_active_subtasks(params[:id])
	end

	def set_users
		@users = UserRepository.new.find_all
	end
end	
