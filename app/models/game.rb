class Game < ActiveRecord::Base

  has_many :user_games
  has_many :users, through: :user_games

  has_many :game_genres
  has_many :genres, through: :game_genres

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  def add_genre(genre)
    self.genre << genre
  end

  def add_array_of_genres(arr)
    arr.each do |genre|
      self.genres << genre
    end
  end

  def slug
    slugify(self.title)
  end

end
