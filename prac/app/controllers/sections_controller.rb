class SectionsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @section = @article.sections.create(section_params)
    if @section.save
      redirect_to @article
    end 
  end

  def destroy
    @article = Article.find(params[:article_id])
    @section = @article.sections.find(params[:id])
    @section.destroy
    redirect_to article_path(@article)
  end
  def edit
    @article = Article.find(params[:article_id])
    @section = @article.sections.find(params[:id])
  end

  def update
        if @section.update(section_params)
      flash[:notice] = "Article successfully updated"
      redirect_to @article
    else
    end
  end

  private
  def section_params
    params.require(:section).permit(:body)
  end 
end