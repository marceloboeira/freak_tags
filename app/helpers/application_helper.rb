module ApplicationHelper
  include FontAwesomeHelper
  include UsersHelper

  # TODO: Make it get a controller translated name
  def page_title
    t :freaktags
  end

  def navbar_logo
    link_to (fa "tags", {text: t(:freaktags)}), (signed_in? ? dashboard_path : root_path), {:class => "navbar-brand logo"}
  end

end
