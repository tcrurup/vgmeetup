class CreatePostsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :board_id
      t.string :board_type
      t.integer :user_id
    end
  end
end
