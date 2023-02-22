class User < ApplicationRecord
  has_many :posts
  has_many :likes, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
end
