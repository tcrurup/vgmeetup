class Post < ActiveRecord::Base

  belongs_to :board, polymorphic: true
  belongs_to :user

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  def slug
    slugify(self.user.username + self.created_at.to_s + self.id.to_s)
  end

  def author
    self.user
  end

end
