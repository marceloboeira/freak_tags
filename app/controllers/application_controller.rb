class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  #rescue_from CanCanCan::AccessDenied do |exception|
  #  redirect_to root_url, :alert => exception.message
  #end



  def current_user
    User.find(1)
  end
end
