module Slugifiable
  module InstanceMethods

    def slugify (string)
      string.gsub(/[:!@#$%^&*]/, "").downcase.split(" ").join("-")
    end

  end

  module ClassMethods

    def find_by_slug(slug)
      self.all.detect{ |x| x.slug == slug  }
    end

  end

end
