class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy

  attribute :posts_count, :integer, default: 0

  def increment_posts_counter!
    update(posts_count: posts_count + 1)
  end

  def decrement_posts_counter!
    update(posts_count: posts_count - 1)
  end

  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end
end
