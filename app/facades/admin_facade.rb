class AdminFacade

  def total_rooms
    Room.count
  end

  def total_messages
    Message.count
  end

  def total_users
    User.count
  end

  def last_metrics
    Metric.order_by(at: :desc)
  end
end