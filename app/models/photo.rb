class Photo < ActiveRecord::Base
  validates :image_url, :presence => true, :uniqueness => true

  has_many :comments
  belongs_to :user

  # belongs_to :sender, :class_name => "User", :foreign_key => "sender_id"
  # belongs_to :receiver, :class_name => "User", :foreign_key => "receiver_id"

  # def comments
  #   return Comment.where(:photo_id => self.id)
  # end
end
