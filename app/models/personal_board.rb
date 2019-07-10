class PersonalBoard < ActiveRecord::Base

  belongs_to :user
  has_many :posts, as: :board
end
