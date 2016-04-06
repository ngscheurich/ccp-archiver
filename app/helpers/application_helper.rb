module ApplicationHelper
  def side_nav_class(nav_item, has_children = true)
    klass = "" + nav_item
    klass << " has-children" if has_children
    klass << " active" if active_page?(nav_item)
    klass
  end

  def active_page?(klass)
    controller = body_class.split[0]
    page = controller == "dashboards" ? "dashboard" : controller
    page == klass
  end
end
