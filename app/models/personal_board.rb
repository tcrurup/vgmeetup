class PersonalBoard < ActiveRecord::Base

  belongs_to :user
  has_many :posts, as: :board

  def new_post(content)
    self.posts << Post.create(content: content)
  end

end
