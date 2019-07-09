class Genre < ActiveRecord::Base

  has_many :game_genres
  has_many :games, through: :game_genres

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  def slug
    slugify(self.name)
  end
end
