class CommunityBoard < ActiveRecord::Base

  belongs_to :game
  has_many :posts, as: :board

  def new_post(title, content)
    self.posts << Post.create(title: title, content: content)
  end

end
