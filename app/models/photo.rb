class Photo < ActiveRecord::Base
  # validates :image_url, :presence => true, :uniqueness => true
  validates :user, :presence => true

  has_many :comments, :dependent => :destroy
  belongs_to :user
  has_many :favorites
  has_many :fans, :through => :favorites, :source => :user

  mount_uploader :image, ImageUploader

  # belongs_to :sender, :class_name => "User", :foreign_key => "sender_id"
  # belongs_to :receiver, :class_name => "User", :foreign_key => "receiver_id"

  # def comments
  #   return Comment.where(:photo_id => self.id)
  # end
end
