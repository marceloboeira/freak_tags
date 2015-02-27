class NewsController < ApplicationController
  load_and_authorize_resource

  def index
    @news = News.all.includes(:author).order(created_at: :desc)
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
    redirect_to(news_index_path, notice: t(:destroyed_successfully))
  end

  private

  def news_params
    params.require(:news).permit(:title, :slug_line, :content)
  end
end
