module FontAwesomeHelper

  # Based on: https://github.com/bokmann/font-awesome-rails/blob/master/app/helpers/font_awesome/rails/icon_helper.rb
  # Font-Awesome icon generator helper - https://github.com/freaktags/core/issues/51
  def fa(names = "question", options = {})
    classes = ["fa"]
    classes.concat fa_array_value(names).map { |n| "fa-#{n}" }
    classes.concat Array(options.delete(:class))
    text = options.delete(:text)
    left = options.delete(:left)
    icon = content_tag(:i, nil, options.merge(:class => classes))

    return icon if text.blank?
    elements = [icon, ERB::Util.html_escape(text)]
    elements.reverse! if left
    safe_join(elements, " ")
  end

  private

  def fa_array_value(value = [])
    value.is_a?(Array) ? value : value.to_s.split(/\s+/)
  end
end
