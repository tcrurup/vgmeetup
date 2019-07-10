class PersonalBoard < ActiveRecord::Base

  belongs_to :user
  has_many :posts, as: :board

  def new_post(content, author)
    post = Post.new(content: content)
    post.user = author
    post.save
    self.posts << post
  end

end
