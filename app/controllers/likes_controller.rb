class LikesController < ApplicationController
    def create
        user = current_user
        post = params[:post_id]
        @like = Like.new(
          posts_id: post,
          author_id: user.id
        )
        return unless @like.save
    
        redirect_to user_post_path(id: post, user_id: user.id)
      end
end
