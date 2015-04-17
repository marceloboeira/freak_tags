class FollowsController < ApplicationController
  before_action :target_user

  def follow
    current_user.follow target_user
    render json: target_user.followers_count
  end

  def unfollow
    current_user.stop_following target_user
    render json: target_user.followers_count
  end

  private

  def target_user
    User.find_by_username(params[:username])
  end
end
