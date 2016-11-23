class CreateRoomFromGithubCommand
  def call(octokit_client, github_org)
    room = Room.find_or_initialize_by(uid: github_org.id)
    logins = octokit_client.organization_public_members(github_org.login).map(&:login)
    room.update_attributes(public_members: logins, avatar: github_org.avatar_url, name: github_org.login)
    room.save!
    room
  end
end
