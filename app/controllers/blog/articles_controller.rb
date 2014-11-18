class Blog::ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    @articles = Blog::Article.where(published: true)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Blog::Article.friendly.find(params[:id])
  end
end
