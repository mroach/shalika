class HomeController < ApplicationController

  def index
    @articles = Blog::Article.where(published: true).limit(5)
  end

end
