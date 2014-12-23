class DashboardController < ApplicationController
  before_filter :authenticate_admin

  def index
    @admin_facade = AdminFacade.new
  end

  def clear_cache
    Rails.cache.clear
    redirect_to action: "index"
  end
end
