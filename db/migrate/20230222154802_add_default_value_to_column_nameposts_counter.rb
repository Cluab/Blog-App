class AddDefaultValueToColumnNamepostsCounter < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :posts_count, :integer , default: 0
  end
end
