class Friend < ActiveRecord::Base

  has_many :user_friends
  has_many :users, through: :user_friends

  def friend
    @friend ||= User.find(self.user_id)
  end

  def username
    friend.username
  end

end
