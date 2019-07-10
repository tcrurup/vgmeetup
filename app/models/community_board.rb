class CommunityBoard < ActiveRecord::Base

  belongs_to :game
  has_many :posts, as: :board
end
