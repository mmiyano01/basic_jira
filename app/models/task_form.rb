class TaskForm < BaseTaskForm
  attr_accessor :subtask_id_list

  def initialize(task_name = nil, status = nil, is_deleted = nil, developer_id = nil, subtask_id_list = nil)
    @task_name = task_name
    @status = status
    @is_deleted = is_deleted
    @developer_id = developer_id
    @subtask_id_list = subtask_id_list
  end
end