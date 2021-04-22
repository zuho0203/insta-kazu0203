class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
      @articles = Article.all.page(params[:page]).per(5)
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

    def edit
      @article = current_user.articles.find(params[:id])
    end

    def update
      @article = current_user.articles.find(params[:id])
      if @article.update(article_params)
        redirect_to article_path(@article), notice: '更新できました'
      else
        flash.now[:error] = '更新できませんでした'
        render :edit
      end
    end

    def destroy
      article = current_user.articles.find(params[:id])
      article.destroy!
      redirect_to root_path, notice: '削除に成功しました'
    end

    private
    def article_params
      params.require(:article).permit(:content, portraits: [])
    end

end