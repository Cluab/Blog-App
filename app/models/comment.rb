class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  delegate :user, to: :post

  def increament_post_comments_counter
    post.increment_comments_count!
  end
end
