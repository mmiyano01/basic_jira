class TaskListController < ApplicationController
	before_action :set_users

	def show
		@tasks = TaskRepository.new.find
	end

	def show_subtask
		task = Task.find(params[:id])
		@task_name = task.task_name
		@task_status = task.status
		@task_id = params[:id]
		@subtasks = SubtaskRepository.new.find_by_task_id(params[:id])
	end

	def set_users
		@users = UserRepository.new.find_all
	end
end	
