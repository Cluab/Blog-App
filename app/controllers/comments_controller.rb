class CommentsController < ApplicationController
  def create
    user = current_user
    post = params[:post_id]
    @comment = Comment.new(
      text: params[:text],
      post_id: post,
      author_id: user.id
    )
    return unless @comment.save

    redirect_to user_post_path(id: post, user_id: user.id)
  end
end
