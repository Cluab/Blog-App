class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = current_user
    @post = Post.find(params[:post_id])
  end

  def create
    user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(
      text: params[:comment][:text],
      author_id: user.id,
      post_id: @post.id
    )
    if @comment.save
      redirect_to user_post_path(id: @post.id, user_id: user.id)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
