class User < ActiveRecord::Base

  has_secure_password

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  def slug
    slugify(self.username)
  end
end
