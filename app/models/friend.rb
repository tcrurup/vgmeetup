class Friend < ActiveRecord::Base

  has_many :user_friends
  has_many :users, through: :user_friends

  def friend_account
    @friend_account ||= User.find(self.user_id)
  end

  def games
    friend_account.games
  end

  def username
    friend_account.username
  end

  def is_friends_with?(user)
    friend_account.is_friends_with?(user)
  end

  def friends
    friend_account.friends
  end

  def slug
    friend_account.slug
  end

end
