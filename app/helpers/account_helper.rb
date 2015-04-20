module AccountHelper

  ## While paperclip isn't ready, let get it from gravatar
  def gravatar_for(user, options = {})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}"
    classes = " "
    classes << options.delete(:class) if options.key? :class
    classes << " gravatar"
    id = options.delete(:id)
    image_tag(gravatar_url, title: user.username, class: classes.to_s, id: id)
  end

  def user_path(user)
    profile_path user.username
  end

  def follow_path(user)
    "#{user_path user}/follow"
  end

  def unfollow_path(user)
    "#{user_path user}/unfollow"
  end

  def follow_button_for(followable, options = {})
    if current_user != user
      classes = " "
      classes << options.delete(:class) if options.key? :class
      classes << " "

      link_to "{{}}",
              "/",
              "data-follow-button": true,
              "data-following": current_user.following?(followable),
              "data-follow-content": CGI::escapeHTML(fa("user-plus", title: "Follow")),
              "data-unfollow-content": CGI::escapeHTML(fa("user-times", title: "Unfollow")),
              "data-follow-url": follow_path(followable),
              "data-unfollow-url": unfollow_path(followable),
              "data-followable-id": followable.id,
              class: classes.to_s
    end
  end
end
