class User < ActiveRecord::Base

  has_secure_password
  has_many :user_games
  has_many :games, through: :user_games

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  def add_game_to_collection(game)
    self.games << game
  end

  def slug
    slugify(self.username)
  end
end
