class ApplicationController < ActionController::Base
  layout 'default'
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :devise_filter, if: :devise_controller?


  private
  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    if request.referer == sign_in_url
      super
    else
      dashboard_path
    end
  end

  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end

  def after_sign_up_path_for(resource)
    new_user_session_path
  end

  protected
  def devise_filter
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :username, :email, :password, :password_confirmation, :current_password, :gender) }
  end
end

