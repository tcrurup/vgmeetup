class Genre < ActiveRecord::Base

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  def slug
    slugify(self.name)
  end
end
