class CommentsController < ApplicationController
  def create
    @comment = Comment.new(user_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to :back, :notice => "Your comment was saved"
    else
      redirect_to :back, :notice => "There were problems... Comments has not been saved"
    end
  end
  
  private

  def user_params
    params.require(:comment).permit(
      :id,
      :title, 
      :content
      )
  end
end