class HomeController < ApplicationController

  def index
    @articles = Blog::Article.where(published: true).limit(2)
  end

end
