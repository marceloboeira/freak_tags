class DashboardController < ApplicationController
  def index
    @activities = PublicActivity::Activity.where(owner_id: current_user.friends.map(&:id)).order("created_at desc")
  end
end
