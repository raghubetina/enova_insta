module ApplicationHelper
  def edit_path(object)
    method_name = "edit_#{object.class.name.underscore}_path"
    self.send(method_name, object)
  end
end
