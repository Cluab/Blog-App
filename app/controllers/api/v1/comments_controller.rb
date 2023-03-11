class Api::V1::CommentsController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    comments = Comment.where(post_id: params[:post_id])
    render json: comments
  end

  def create
    request_body = JSON.parse(request.body.read)
    comment = Comment.new(
      author_id: current_user.id,
      post_id: params[:post_id],
      text: request_body['comment']['text']
    )
    if comment.save
      render json: comment, status: :created
    else
      errors = comment.errors.full_messages
      errors << 'Please provide a comment text.' if errors.include?("Text can't be blank")
      render json: { errors: errors }, status: :unprocessable_entity
    end
  end

  private

  def comment_body
    params.require(:comment).permit(:text)
  end
end
