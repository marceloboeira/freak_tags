class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_user, :user_signed_in?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      session.delete(:user_id)
      nil
  end

  def user_signed_in?
    !current_user.nil?
  end

  def authenticate!
    user_signed_in? || redirect_to(root_url, notice: t(:must_be_authenticated))
  end
end

