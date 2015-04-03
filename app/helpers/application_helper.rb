module ApplicationHelper
  include FontAwesomeHelper
  include UsersHelper

  # TODO: Make it get a controller translated name
  def page_title
    title = t(:freaktags)
    if Rails.env.development?
      "#{title} (#{FreakTags::Application::VERSION})"
    else
      title
    end
  end

  def navbar_logo
    link_to (fa "tags", {text: t(:freaktags)}), (signed_in? ? dashboard_path : root_path), {:class => "navbar-brand logo"}
  end

  def navbar_left_logo
    link_to (fa "tags"), dashboard_path
  end

  def datetime_ago date
    content_tag :date, nil, title: date.to_s(:long), "data-source": date.to_s(:rfc822)
  end
end
