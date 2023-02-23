class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy

  valedates :name, presence: true
  valedates :post_count, numricality: { greater_than_or_equal_to: 0 }

  def increment_posts_count!
    self.posts_count += 1
    save!
  end

  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end
end
