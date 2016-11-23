class UpdateUserOrganizationsCommand
  def call(octokit_client, user)
    organizations = octokit_client.orgs(user.nickname)

    organizations.each do |github_org|
      room = RoomService.new(nil, octokit_client).find_and_update_room(github_org)
      user.rooms.push(room) unless user.rooms.include? room
    end
  end
end
