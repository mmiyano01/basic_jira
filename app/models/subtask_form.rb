class SubtaskForm < BaseTaskForm
  def initialize(task_name = nil, status = nil, is_deleted = nil, developer_id = nil)
    @task_name = task_name
    @status = status
    @is_deleted = is_deleted
    @developer_id = developer_id
  end
end