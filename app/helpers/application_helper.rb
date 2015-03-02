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

  def datetime_ago date
    content_tag :date, nil, "data-source": date.to_s(:rfc822)
  end

  def destroy_button resource
    link_to fa("trash", :text => t(:destroy)),
      resource,
      class: "btn btn-danger btn-destroy",
      "data-destroy": true,
      "data-destroy-message": content_tag(:h4, (t(:are_you_sure_destroy, title: content_tag(:u, resource.try(:title) || resource.try(:name)).html_safe)))
  end
end
