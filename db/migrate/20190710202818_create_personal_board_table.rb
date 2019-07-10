class CreatePersonalBoardTable < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_boards do |t|
      t.integer :user_id
    end
  end
end
