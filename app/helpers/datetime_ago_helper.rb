module DateTimeAgoHelper

  def datetime_ago(date)
    if !date.nil?
      content_tag :date, nil, title: date.to_s(:long), "data-source": date.to_time.to_i
    end
  end
end
