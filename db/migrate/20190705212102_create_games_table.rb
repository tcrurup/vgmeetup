class CreateGamesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :release_year
    end
  end
end
