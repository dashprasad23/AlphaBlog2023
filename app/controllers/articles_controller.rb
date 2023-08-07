class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = User.first.id
    if @article.save
       redirect_to articles_path
    else
      render 'new' , :status => 401
    end
  end

  def  new
    @article = Article.new
  end

  def update
     if @article.update(article_params)
       redirect_to articles_path
     else
       render 'edit', :status => 401
     end
  end

  def edit
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end