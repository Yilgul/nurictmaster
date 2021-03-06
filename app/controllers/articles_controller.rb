class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @articles = Article.all
    @article = Article.find(params[:id])
  end

  def new
    if user_signed_in?
      @article = current_user.articles.build
    else
      redirect_to articles_url
      flash[:alert] = "U dient ingelogd te zijn om nieuws toe te voegen"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to @article
      flash[:notice] = "Nieuwsbericht toegevoegd"
    else
      render 'new'
      flash[:alert] = "Sorry"
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
      flash[:notice] = "Update nieuwsbericht succesvol"
    else
      render 'edit'
      flash[:alert] = "Sorry"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
    flash[:notice] = "Nieuwsbericht verwijderd"
  end

  private
  def article_params
    @article = params.require(:article).permit(:title, :text, :date, :image)
  end
end
