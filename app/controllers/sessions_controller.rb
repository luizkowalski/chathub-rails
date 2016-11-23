class SessionsController < ApplicationController
  include OctokitableController

  def create
    store_github_token
    user = LoginService.new.call(octokit_client, auth_hash)
    session[:uid] = user.uid
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
