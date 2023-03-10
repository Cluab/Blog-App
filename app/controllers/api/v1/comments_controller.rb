class Api::V1::CommentsController < ApplicationController
  def index
    comments = Comment.where(post_id: params[:post_id])
    render json: comments
  end

  def create
    @post = Post.find(params[:post_id])
    @user = User.last
    @comment = Comment.create( author: @user, post: Post.find(params[:post_id]), text: comment_params[:text])    
    respond_to do |format|
      if @comment.save
        format.json { render json: @comment, status: :created }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:text)
  end
end  