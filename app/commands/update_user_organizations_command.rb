class UpdateUserOrganizationsCommand
  def call(octokit_client, user)
    organizations = octokit_client.orgs(user.nickname)

    organizations.each do |github_org|
      room = CreateRoomFromGithubCommand.new.call(octokit_client, github_org)
      user.rooms.push(room) unless user.rooms.include? room
    end
  end
end
