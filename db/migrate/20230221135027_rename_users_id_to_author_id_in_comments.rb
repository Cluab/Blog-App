class RenameUsersIdToAuthorIdInComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :users_id, :author_id
  end
end
