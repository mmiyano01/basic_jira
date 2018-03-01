class SubtaskRepository
  def find_by_task_id(task_id)
    subtasks = Subtask.where(task_id: task_id, is_deleted: false)
    subtasks.map do |s|
      SubtaskForm.new(s.id, s.task_name, s.status, s.is_deleted, s.developer_id)
    end
  end

  def create(task_name, status, is_deleted, developer_id, task_id)
    Subtask.new(task_name: task_name, status: status, is_deleted: is_deleted, developer_id: developer_id, task_id: task_id).save
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

  def create_id_list(task_id)
    Subtask.where(task_id: task_id, is_deleted: false).map{|st| st.id}
  end

  def all_done?(task_id)
    subtasks = Subtask.where(task_id: task_id, is_deleted: false)
    subtasks.map{|s| s.status == 'done'}.all? if subtasks.present?
  end

  def delete_all_subtask(task_id)
    Subtask.where(task_id: task_id, is_deleted: false).each do |st|
      st.is_deleted = true
      st.save
    end
  end
end