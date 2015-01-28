module UsersHelper


  # TODO: Make it a real helper
  def user_image_tag
    image_tag "/assets/images/users/default.jpg", {id: "navbar-left-user-img", class: "img-circle "}
  end
end
