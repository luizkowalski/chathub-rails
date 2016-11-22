class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(uid: session[:uid]) if session[:uid]
  end

  def authenticate
    redirect_to root_path, notice: 'Please login with your GitHub account to continue' unless current_user
  end

  def authenticate_admin
    redirect_to root_path, notice: 'You are not allowed to access this page' unless admin?
  end

  def admin?
    Admin.find_by(uid: current_user.uid) if current_user
  end

  helper_method :current_user, :authenticate, :admin?
end
