class LikesController < ApplicationController
    before_action :authenticate_user!

  def show
     article = Article.find(params[:article_id])
     like_status = current_user.has_liked?(article)
     redirect_to article_path(article)
  end

  def create
    article = Article.find(params[:article_id])
    article.likes.create!(user_id: current_user.id)

  end

  def destroy
    article = Article.find(params[:article_id])
    like = article.likes.find_by!(user_id: current_user.id)

    like.destroy!
    redirect_to article_path(article)
  end
end