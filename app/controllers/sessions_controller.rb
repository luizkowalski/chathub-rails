class SessionsController < ApplicationController
  include OctokitableController

  def create
    store_github_token

    @user = User.find_or_create_from_auth_hash(auth_hash)
    @user.update_last_login
    UserService.new(@user, octokit_client).update_user_organizations

    session[:uid] = @user.uid
    MetricServices.user_signed_in(@user.uid)
    redirect_to rooms_path
  end

  def destroy
    session[:uid] = nil
    redirect_to root_path
  end

  def new
    redirect_to '/auth/github'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def store_github_token
    session[:token] = auth_hash['credentials']['token']
  end
end
