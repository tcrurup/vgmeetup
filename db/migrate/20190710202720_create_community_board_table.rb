class CreateCommunityBoardTable < ActiveRecord::Migration[5.2]
  def change
    create_table :community_boards do |t|
      t.integer :game_id
    end
  end
end
