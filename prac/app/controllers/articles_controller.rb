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
  @categories = Category.all.map{ |cat| [cat.name, cat.id] }
end

def create
 @article = Article.new(article_params)
 @article.category_id = params[:category_id]
  @article.user = current_user
    respond_to do |format| 
   if @article.save 
      format.html { redirect_to @article, notice: 'Product was successfully created.' } 
       format.json { render :show, status: :created, location: @article } 
   else 
       format.html { render :new } 
       format.json { render json: @article.errors, status: :unprocessable_entity } 
   end 
  end 
end

def search
 @article = Article.search(params[:search].split("=").last)
 respond_to :js
end

  def edit
    @article = Article.find(params[:id])
    @categories = Category.all.map { |cat| [cat.name, cat.id] }
    if @article.user_id != current_user.id
      redirect_to root_path, notice: "You do not have permission to edit this article"

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
    @article.category_id = params[:category_id]
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
    redirect_to root_path
  end
  end

  def article_params
    params.require(:article).permit(:title , :text)
  end


end
