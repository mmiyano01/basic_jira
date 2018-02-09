class TaskListRepository

	def find_active_tasks
		tasks = Task.where(is_deleted: false)
		tasks.each do |t|
			TaskForm.new(t.task_name, t.status, t.is_deleted, t.developer_id, subtask_id_list(t))
		end
	end

	def create(task)
		task.save
	end

	def create_task(task_name, status, is_deleted, developer_id)
		create(Task.new(task_name: task_name, status: status, is_deleted: is_deleted, developer_id: developer_id))
	end

	def create_subtask(task_name, status, is_deleted, developer_id, task_id)
		create(Subtask.new(task_name: task_name, status: status, is_deleted: is_deleted, developer_id: developer_id, task_id: task_id))
		task = Task.find(task_id)
		if task.status == 'todo'
			status_update(task)
		end
	end

	def status_update(task)
		next_status =
				case task.status
					when 'todo'
						'doing'
					when 'doing'
						'done'
				end
		task.status = next_status
		task.save
	end

	def delete(task)
		task.is_deleted = true
		task.save
	end

	def edit
	end

	private

	def subtask_id_list(task)
		Subtask.where(task_id: task.id).map{|st| st.id}
	end

end	
