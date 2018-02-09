class TaskListController < ApplicationController
	before_action :set_users

	def show
		@tasks = TaskListRepository.new.find_active_tasks
	end

	def set_users
		@users = UserRepository.new.find_all
	end
end	
