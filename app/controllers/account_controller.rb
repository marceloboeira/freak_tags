class AccountController < ApplicationController
  before_action :set_user, only: [:show]

  def show

  end

  private

    def set_user
      @user = User.find_by_username(params[:username])
    end

    def user_params
      params.require(:user).permit(:username, :email)
    end
end
