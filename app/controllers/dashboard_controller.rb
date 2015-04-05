class DashboardController < ApplicationController
  def index
    @activities = current_user.friends_activities
  end
end
