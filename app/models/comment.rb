class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  delegate :user, to: :post

  after_save :update_comments_counter

  private

  def update_comments_counter
    post.update(comments_count: post.comments.all.length)
  end
end
