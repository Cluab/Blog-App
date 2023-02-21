class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :users, null: false, foreign_key: true
      t.references :post
      t.text :text

      t.timestamps
    end
  end
end
