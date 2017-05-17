class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    if @comment.save
      flash[:notice] = " Reactie toegevoegd"
      redirect_to article_path(@article)
    else
      @article = Article.all
      render 'articles/show'
      flash[:alert] = " Uw reactie is leeg"
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
    flash[:notice] = " Reactie verwijderd"
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(commenter: current_user.username)
  end
end
