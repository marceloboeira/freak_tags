class HomeController < PublicController

  def index
    if signed_in?
      redirect_to dashboard_path
    end
  end
end
