class Post < ActiveRecord::Base

  belongs_to :board, polymorphic: true
end
