class Favorite < ActiveRecord::Base
  validates :user, :presence => true
  validates :photo, :presence => true

  validates :user, :uniqueness => { :scope => :photo, :message => "has already favorited that photo"}

  belongs_to :user
  belongs_to :photo
end
