class PostsController < ApplicationController
  def new
    @post = Post.new
    @user = current_user
  end

  def create
    user = current_user
    @post = Post.new(
      title: params[:post][:title],
      text: params[:post][:text],
      author_id: user.id
    )
    if @post.save
      redirect_to user_post_path(id: @post.id, user_id: user.id)
    else
      render :new
    end
  end
  

  def index
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = Comment.where(post_id: params[:id])
    @user = User.find(params[:user_id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
