class Comment < ActiveRecord::Base
  validates :photo, :presence => true
  validates :content, :presence => true

  validates :content, :uniqueness => { :scope => :photo_id }

  belongs_to :user
  belongs_to :photo #, :class_name => "Photo", :foreign_key => "photo_id"

  # def photo
  #   return Photo.find_by :id => self.photo_id
  # end
end
