class ArticlesController < ApplicationController
  
  def index 
     @article = Article.search(params[:search])
  end
  def show

    @article = Article.find(params[:id])
    authorize! :read, @article
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
       def search
          @article = Article.search(params[:search].split("=").last)
          respond_to :js
      end

  def edit
    @article = Article.find(params[:id])
    if @article.user_id != current_user.id
      render 'error'

    else
      @article = current_user.articles.find(params[:id]) 
      flash[:notice] ="Edited successfully" 
    end
  end

  def userarticles
    @article = Article.all
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
    if @article.user_id == current_user.id
    @article.destroy
    redirect_to articles_path
  else
    render 'error'
  end
  end

  def article_params
    params.require(:article).permit(:title , :text)
  end


end
