module DashboardHelper

  def show_dashboard
    "hidden" if !admin?
  end
end