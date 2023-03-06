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
    @posts = Post.includes(:author, :comments).where(author_id: params[:user_id])
    @user = @posts[0].author
  end

  def show
    @post = Post.includes(:comments, :author).find_by(id: params[:id])
    @comments = @post.comments
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
