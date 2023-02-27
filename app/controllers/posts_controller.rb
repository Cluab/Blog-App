class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:id])
  end

  def show
    @post = Post.find_by(id: params[:post_id])
    @comments = Comment.where(post_id: params[:post_id])
  end
end