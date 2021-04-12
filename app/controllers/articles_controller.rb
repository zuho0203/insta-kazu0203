class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
      @articles = Article.all
    end

    def new
      @article = current_user.articles.build
    end

    def show
      @article = Article.find(params[:id])
    end

    def create
      @article = current_user.articles.build(article_params)
        if @article.save
          redirect_to article_path(@article), notice: '保存できました'
        else
          flash.now[:error] = '保存に失敗しました'
          render :new
        end
    end

    private
    def article_params
      params.require(:article).permit(:content, portraits: [])
    end

end