class Photo < ActiveRecord::Base
  validates :image_url, :presence => true
end
