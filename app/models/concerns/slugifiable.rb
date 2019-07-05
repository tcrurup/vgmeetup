module Slugifiable
  module InstanceMethods

    def slug
      self.name.split(" ").join("-")
    end

  end

  module ClassMethods

    def find_by_slug(slug)
      self.all.detect{ |x| x.slug == slug  }
    end

  end

end
