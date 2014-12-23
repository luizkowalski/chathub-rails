module SignInHelper

  def create_and_authenticate_user
    @user = create(:user)
    session[:uid] = @user.uid
  end
end