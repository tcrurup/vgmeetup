class User < ActiveRecord::Base

  has_secure_password
  has_many :user_games
  has_many :games, through: :user_games
  has_one :personal_board

  after_initialize do |user|
    user.personal_board = PersonalBoard.create()
  end

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  def add_game_to_collection(game)
    self.games << game
  end

  def owns_game?(game)
    self.games.include?(game)
  end

  def remove_game_from_collection(game)
    self.games.delete(game)
  end

  def slug
    slugify(self.username)
  end
end
