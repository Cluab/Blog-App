class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, foreign_key: 'post_id', dependent: :destroy
  has_many :comments, foreign_key: 'post_id', dependent: :destroy

  after_save :increment_author_posts_counter

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  def increment_likes_count!
    update(likes_count: likes_count + 1)
  end

  private

  def increment_author_posts_counter
    author.increment_posts_count!
  end
end
