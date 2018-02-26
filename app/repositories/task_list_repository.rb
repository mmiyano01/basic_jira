class TaskListRepository

	def find_active_tasks
		tasks = Task.where(is_deleted: false)
		tasks.map do |t|
			status = t.status
			if subtask_all_done?(t.id)
				status_update(t) unless t.status == 'done'
				status = 'done'
			end
			TaskForm.new(t.id, t.task_name, status, t.is_deleted, t.developer_id, subtask_id_list(t.id))
		end
	end

	def find_active_subtasks(task_id)
		subtasks = Subtask.where(task_id: task_id, is_deleted: false)
		subtasks.map do |s|
			SubtaskForm.new(s.id, s.task_name, s.status, s.is_deleted, s.developer_id)
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

	def subtask_id_list(task_id)
		Subtask.where(task_id: task_id, is_deleted: false).map{|st| st.id}
	end

	def subtask_all_done?(task_id)
		subtasks = Subtask.where(task_id: task_id, is_deleted: false)
		subtasks.map{|s| s.status == 'done'}.all? if subtasks.present?
	end
end
