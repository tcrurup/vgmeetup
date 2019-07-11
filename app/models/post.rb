class Post < ActiveRecord::Base

  belongs_to :board, polymorphic: true
  belongs_to :user

  has_many :replies

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  def add_reply(content, user)
    reply = Reply.create(content: content, user: user)
    reply.post = self
    reply.save
    self.replies << reply
  end

  def redirection_string
    case self.board_type
    when "PersonalBoard"
      "/user/#{self.board.user.slug}"
    when "CommunityBoard"
      "/games/#{self.board.game.slug}"
    end
  end


  def slug
    slugify(self.user.username + self.created_at.to_s + self.id.to_s)
  end
end
