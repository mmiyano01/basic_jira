module TaskListHelper
  def changeable_status?(status)
    status != 'done'
  end
end