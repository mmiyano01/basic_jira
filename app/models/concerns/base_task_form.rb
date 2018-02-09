class BaseTaskForm
  include ActiveModel::Model
  attr_accessor :task_name, :status, :is_deleted, :developer_id

end