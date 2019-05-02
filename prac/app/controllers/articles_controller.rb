class ArticlesController < ApplicationController
    load_and_authorize_resource

    def index 
     @article = Article.search(params[:search])
  end

  def show
  end

  def new
    @categories = Category.all.map{ |cat| [cat.name, cat.id] }
  end

  def create
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
    @categories = Category.all.map { |cat| [cat.name, cat.id] }
    if @article.user_id != current_user.id
      redirect_to article_path, notice: "You do not have permission to edit this article"
    else
      flash[:notice] ="Edited successfully" 
    end
  end

  def userarticles
    @article = Article.all
  end

  def update
    @article.category_id = params[:category_id]
    if @article.update(article_params)
      flash[:notice] = "Article successfully updated"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    if @article.user_id == current_user.id
      @article.destroy
      redirect_to root_path
    end
  end

private
  def article_params
    params.require(:article).permit(:title , :text , sections_attributes: [:id , :body, :_destroy])
  end


end
