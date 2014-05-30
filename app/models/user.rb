class User < ActiveRecord::Base
  validates :nickname, :presence => true, :uniqueness => true

  has_many :photos
  has_many :comments
  has_many :favorites
end
