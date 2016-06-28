class PostsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new()
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(user_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, :notice => "Your post was saved"
    else
      render "new"
    end
  end
  
  def edit
    @post = Post.find(params[:id])  
    if current_user.id != @post.user_id
      redirect_to new_user_session_path
    end
  end
  
  def update
    @post = Post.find(params[:id]) 
    
    if @post.update_attributes(user_params)
      redirect_to posts_path, :notice => "Your post was updated"
    else
      render "edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, :notice => "Your post has been deleted"
  end
  private

  def user_params
    params.require(:post).permit(
      :id,
      :title, 
      :content
      )
  end
  
end
