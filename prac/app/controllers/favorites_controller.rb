class FavoritesController < ApplicationController
  before_action :set_article
  
  def create
    if Favorite.create(favorited: @article, user: current_user)
      redirect_to @article, notice: 'Article has been favorited'
    else
      redirect_to @article, alert: 'Something went wrong...'
    end
  end
  
  def destroy
    @favorite = Favorite.where(favorited_id: @article.id, user_id: current_user.id).first
    @favorite.destroy
    redirect_to @article, notice: 'Article is no longer in favorites'
    end
  private
  
  def set_article
    @article = Article.find(params[:article_id] || params[:id])
  end
end

