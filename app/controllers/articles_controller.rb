class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    #@article.save
    #redirect_to article_path(@article)
    if @article.save
      #do something
      flash[:notice] = "Article was succesfully saved"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def update
    #@article = Article.find(params[:id])
    if @article.update(article_params)
      #do something
      flash[:notice] = "Article was succesfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end


    def destroy
      #@article = Article.find(params[:id])
      @article.destroy
        #do something
      flash[:notice] = "Article was succesfully deleted"
      redirect_to articles_path

    end

  def show
    #@article = Article.find(params[:id])
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title,:description)
  end



end
