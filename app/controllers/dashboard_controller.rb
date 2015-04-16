class DashboardController < ApplicationController
  def index
    @activities = current_user.follows_activities
  end
end
