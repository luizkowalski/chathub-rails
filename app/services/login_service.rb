class LoginService
  def call(octokit_client, auth_hash)
    user = LoginUserCommand.new.call(auth_hash)
    UpdateUserOrganizationsCommand.new.call(octokit_client, user)
    SaveMetricCommand.new.call(MetricTypes::USER_SIGN_IN, user, nil)
    user
  end
end
