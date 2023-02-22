class AddPostsCounterToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :PostsCounter, :integer, default: 0
  end
end
