class TaskRepository
  def find
    tasks = Task.where(is_deleted: false)
    subtask_repository = SubtaskRepository.new
    tasks.map do |t|
      status = t.status
      if subtask_repository.all_done?(t.id)
        status_update(t) unless t.status == 'done'
        status = 'done'
      end
      TaskForm.new(t.id, t.task_name, status, t.is_deleted, t.developer_id, subtask_repository.create_id_list(t.id))
    end
  end

  def create(task_name, status, is_deleted, developer_id)
    Task.new(task_name: task_name, status: status, is_deleted: is_deleted, developer_id: developer_id).save
  end

  def status_update(task)
    next_status =
        case task.status
          when 'todo'
            'doing'
          when 'doing'
            'done'
        end
    if next_status.present?
      task.status = next_status
      task.save
    end
  end

  def delete(task)
    task.is_deleted = true
    task.save
    SubtaskRepository.new.delete_all_subtask(task.id)
  end
end