class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  def index
    @news = News.all
  end

  def show

  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)

    @news.author = current_user
    if @news.save
      redirect_to(@news, notice: t(:created_successfully))
    else
      render :new
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
      @news = News.find(params[:id])
    end

    def news_params
      params.require(:news).permit(:title, :slug, :slug_line, :content)
    end
end