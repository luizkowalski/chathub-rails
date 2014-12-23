class AdminFacade

  def total_rooms
    Room.count
  end

  def total_messages
    Rails.cache.fetch("total_messages", expires_in: 24.hours) do
      Message.count
    end
  end

  def total_users
    Rails.cache.fetch("total_users", expires_in: 24.hours) do
      User.count
    end
  end
end