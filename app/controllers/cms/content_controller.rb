class Cms::ContentController < ApplicationController

  def show
    @page = Cms::Page.friendly.find(params[:cms_path])
  end
end
