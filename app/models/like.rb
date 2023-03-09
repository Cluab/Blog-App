class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  after_save :increament_post_likes_counter

  private

  def increament_post_likes_counter
    post.increment_likes_count!
  end
end
