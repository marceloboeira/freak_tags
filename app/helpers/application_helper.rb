module ApplicationHelper
  include FontAwesomeHelper
  include AccountHelper

  # TODO: Make it get a controller translated name
  def page_title
    title = t(:freaktags)
    if Rails.env.development?
      return "#{title} (#{FreakTags::Application::VERSION})"
    end
    title
  end

  def navbar_logo
    link_to (fa "tags", {text: t(:freaktags)}), (signed_in? ? dashboard_path : root_path), {:class => "navbar-brand logo"}
  end

  def navbar_left_logo
    link_to (fa "tags"), dashboard_path
  end

  def datetime_ago date
    content_tag :date, nil, title: date.to_s(:long), "data-source": date.to_time.to_i
  end
end
