class AccountController < ApplicationController
  before_action :set_user


  def settings

  end

  def update
    notice = t(@user.update(user_params) ? :updated_successfully : :something_went_wrong)
    render :settings, notice: notice
  end

  private
    def set_user
      @user = User.find_by_id(current_user.id)
    end

    def user_params
      params.require(:user).permit(:name, :username, :email, :password)
    end
end
