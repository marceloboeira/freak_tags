module TagsHelper

  def tag_path(tag)
    "/tags/#{tag.name}"
  end

  def link_tag(tag)
    link_to(content_tag(:span, tag.name, class: "tag label label-primary"), tag_path(tag))
  end
end
