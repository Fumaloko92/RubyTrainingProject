class CommentsController < ApplicationController
  def create
    @comment = Comment.new(user_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to :back, :notice => "Your comment was saved"
    else
      render :back
    end
  end
  
  private

  def user_params
    params.require(:comment).permit(
      :id,
      :title, 
      :content,
      :post_id
      )
  end
end