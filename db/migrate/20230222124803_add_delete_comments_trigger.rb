class AddDeleteCommentsTrigger < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE FUNCTION delete_comments_on_post_delete() RETURNS TRIGGER AS $$
      BEGIN
        DELETE FROM comments WHERE post_id = OLD.id;
        RETURN OLD;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER delete_comments_trigger
      AFTER DELETE ON posts
      FOR EACH ROW
      EXECUTE FUNCTION delete_comments_on_post_delete();
    SQL
  end

  def down
    execute <<-SQL
      DROP TRIGGER IF EXISTS delete_comments_trigger ON posts;
      DROP FUNCTION IF EXISTS delete_comments_on_post_delete();
    SQL
  end
end
