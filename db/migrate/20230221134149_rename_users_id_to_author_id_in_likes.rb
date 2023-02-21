class RenameUsersIdToAuthorIdInLikes < ActiveRecord::Migration[6.1]
  def change
    rename_column :likes, :users_id, :author_id
  end
end
