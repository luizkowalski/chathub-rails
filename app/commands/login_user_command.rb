class LoginUserCommand
  def call(auth_hash)
    user = User.find_or_create_from_auth_hash(auth_hash)
    user.update_last_login
    user
  end
end
