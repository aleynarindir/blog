class CommentsController < ApplicationController
  http_basic_authenticate_with name: "aleynanarin", password: "1234", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)

    if @comment.save
      redirect_to @article
    else
      redirect_to @article
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status) 
  end
end


