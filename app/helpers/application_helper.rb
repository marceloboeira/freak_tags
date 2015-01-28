module ApplicationHelper
  include FontAwesomeHelper
  include UsersHelper


  def navbar_logo
    image_tag('/assets/images/logo/navbar-top.png', {:class => "logo"})
  end
end
