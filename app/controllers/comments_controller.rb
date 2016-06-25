class CommentsController < ApplicationController
  before_action :authenticate_user!
  
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
  
  def edit
    @comment = Comment.find(params[:id])
    if @comment.user.id != current_user.id
      redirect_to :back, :notice => "Unauthorized"
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if current_user == @comment.user || current_user == @comment.post.user
      @comment.destroy
      redirect_to :back, :notice => "Your post has been deleted"
    end
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      if @comment.update_attributes(user_params)
        redirect_to :back, :notice => "Your comment was updated"
      else
        render "edit"
      end
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
