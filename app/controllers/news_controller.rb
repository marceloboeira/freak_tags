class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  def index
    @news = User.all
  end

  def show

  end

  def create
    @news = news.new(news_params)

    if @news.save
      redirect_to(@news, notice: t(:created_successfully))
    else
      render :news
    end
  end

  def update
    if @news.update(news_params)
      redirect_to(@news, notice: t(:updated_successfully))
    else
      render :edit
    end
  end

  def destroy
    @news.destroy
    redirect_to(news_url, notice: t(:destroyed_successfully))
  end

  private
    def set_news
      @news = News.find_by_slug(params[:slug])
    end

    def news_params
      params.require(:news).permit(:title, :slug)
    end
end
