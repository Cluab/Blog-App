class Api::V1::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    render json: @comments
  end
end
