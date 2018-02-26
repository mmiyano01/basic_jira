module TaskListHelper
  def unchangeable_status?(status, id_list = nil)
    status == 'done' || id_list.present?
  end
end