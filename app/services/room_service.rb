class RoomService
  def initialize(name = nil, client = nil)
    @name = name
    @client = client
  end

  def top_rooms
    result = []
    Message.top_rooms_from_messages.each do |room|
      top_room = Room.find room[:_id]
      result << TopRoom.new(top_room.avatar, top_room.name, room[:count]) if top_room
    end
    result
  end

  def find_or_create_room
    room = Room.find_by name: @name
    room = try_create_from_api unless room
  rescue => e
    raise e
  else
    room
  end

  def find_and_update_room(github_organization)
    room = Room.find_or_create_by(uid: github_organization.id)

    logins = @client.organization_public_members(github_organization.login).map(&:login)
    room.update_attributes(public_members: logins, avatar: github_organization.avatar_url, name: github_organization.login)

    room
  end

  protected

  def try_create_from_api
    room = nil
    begin
      org = @client.org(@name)
      room = find_and_update_room(org)
    rescue => e
      raise e
    else
      room
    end
  end
end
