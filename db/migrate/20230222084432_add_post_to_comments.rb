class AddPostToComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :post_id
    add_reference :comments, :post, foreign_key: true
  end
end
