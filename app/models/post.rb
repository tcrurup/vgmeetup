class Post < ActiveRecord::Base

  belongs_to :board, polymorphic: true
  belongs_to :user
end
