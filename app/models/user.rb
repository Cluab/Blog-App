class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  # device confirmation
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  validates :posts_count, numericality: { greater_than_or_equal_to: 0 }

  def increment_posts_count!
    update(posts_count: posts_count + 1)
  end

  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end

  def admin?
    role == 'admin' ? true : false
  end
end
