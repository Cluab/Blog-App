class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    return unless @post.save

    redirect_to user_post_path(id: @post.id, user_id: current_user.id)
  end

  def index
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = Comment.where(post_id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
