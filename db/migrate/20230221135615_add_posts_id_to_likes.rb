class AddPostsIdToLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :posts, null: false, foreign_key: true
  end
end
