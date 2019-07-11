class User < ActiveRecord::Base

  has_secure_password
  has_many :user_games
  has_many :games, through: :user_games
  has_many :posts
  has_many :user_friends
  has_many :friends, through: :user_friends
  has_one :personal_board

  after_initialize do |user|
    user.personal_board ||= PersonalBoard.create()
  end

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods


  def add_friend(user)
    self.friends << Friend.find_or_create_by(user_id: user.id)
  end

  def add_game_to_collection(game)
    self.games << game
  end

  def num_games_in_common_with(user)
    x = 0;
    self.games.each do |game|
      x += 1 if user.games.include?(game)
    end
    x
  end

  def owns_game?(game)
    self.games.include?(game)
  end

  def post_to_other_users_board(content, other_user)
    other_user.personal_board.new_post(content, self)
  end

  def remove_game_from_collection(game)
    self.games.delete(game)
  end

  def slug
    slugify(self.username)
  end
end
