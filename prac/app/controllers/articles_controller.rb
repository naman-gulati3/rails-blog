class ArticlesController < ApplicationController
before_action :authenticate_user! , except: [:show, :index]
  def index 
    @article = Article.all
  end
  def show

    @article = Article.find(params[:id])

  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
end 
  def edit
      @article = current_user.articles.find(params[:id]) 
      flash[:notice] ="Edited successfully" 
    end
  end

  def update

    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article successfully updated"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article= Article.find(params[:id]) 
    @article.destroy
    redirect_to articles_path
  end
  private
  def article_params
    params.require(:article).permit(:title , :text)
  end


end
