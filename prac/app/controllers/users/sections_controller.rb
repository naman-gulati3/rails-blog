class SectionsController < ApplicationController
	def create
	    @article = Article.find(params[:article_id])
    @section = @article.sections.create(section_params)
    @section.user = current_user
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
  private
  def sections_params
    params.require(:comment).permit(:body)
  end 
	end
end