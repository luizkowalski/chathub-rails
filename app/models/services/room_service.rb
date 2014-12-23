class RoomService

  def initialize(name = nil, client = nil)
    @name = name
    @client = client
  end

  def find_or_create_room
    begin
      room = Room.find_by name: @name
      if !room
        room = try_create_from_api
      end
    rescue Exception => e
      raise e
    else
      room
    end

  end

  def find_and_update_room(github_organization)
    room = Room.find_or_create_by(uid: github_organization.id)

    logins =  @client.organization_public_members(github_organization.login).map(&:login)
    room.update_attributes(public_members: logins, avatar: github_organization.avatar_url, name: github_organization.login)

    room
  end

  protected
  def try_create_from_api
    room = nil
    begin
      org = @client.org(@name)
      room = find_and_update_room(org)
    rescue Exception => e
      raise e
    else
      room
    end
  end


end