class Favorite < ActiveRecord::Base
  validates :user, :presence => true
  validates :photo, :presence => true

  belongs_to :user
  belongs_to :photo
end
