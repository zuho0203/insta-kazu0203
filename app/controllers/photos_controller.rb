class PhotosController < ApplicationController
  def show
    @articles = Article.all
  end
end
