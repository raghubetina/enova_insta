class Photo < ActiveRecord::Base
  validates :image_url, :presence => true, :uniqueness => true
end
