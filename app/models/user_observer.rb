class UserObserver < Mongoid::Observer

  def after_create(user)
    MetricServices.user_signed_up(user.uid)
  end
end