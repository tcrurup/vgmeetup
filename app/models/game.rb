class Game < ActiveRecord::Base

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  def slug
    slugify(self.title)
  end

end
