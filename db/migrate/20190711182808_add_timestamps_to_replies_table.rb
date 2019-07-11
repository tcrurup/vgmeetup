class AddTimestampsToRepliesTable < ActiveRecord::Migration[5.2]
  def change
    add_timestamps(:replies, null:true)
  end
end
