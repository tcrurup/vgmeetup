class CommunityBoard < ActiveRecord::Base

  belongs_to :game
  has_many :posts, as: :board

  def new_post(content)
    self.posts << Post.create(content: content)
  end

  def slug

  end

end
