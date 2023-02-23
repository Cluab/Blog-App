class RenamePostsCounterToPostCountInUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :posts_counter, :posts_count
  end
end
