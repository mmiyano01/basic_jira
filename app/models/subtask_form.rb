class SubtaskForm < BaseTaskForm
  def initialize(id = nil, task_name = nil, status = nil, is_deleted = nil, developer_id = nil)
    @id = id
    @task_name = task_name
    @status = status
    @is_deleted = is_deleted
    @developer_id = developer_id
  end
end