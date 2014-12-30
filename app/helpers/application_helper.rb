module ApplicationHelper
  def flash_class(level)
    case level
    when 'notice' then "alert alert-info"
    when 'success' then "alert alert-success"
    when 'error' then "alert alert-danger"
    when 'alert' then "alert alert-warning"
    end
  end

  def human_date(date)
    date.strftime("%d %b %Y")
  end

  def human_date_time(date)
    date.strftime("%d %b %Y, %H:%M:%S - %Z")
  end
end
