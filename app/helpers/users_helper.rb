module UsersHelper

  ## While paperclip isn't ready, let get it from gravatar
  def gravatar_for(user, options = {})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    classes = " "
    classes << options.delete(:class)
    classes << " gravatar"
    id = options.delete(:id)
    image_tag(gravatar_url, title: user.username, class: classes.to_s, id: id)
  end
end
