class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validates :nickname, :presence => true, :uniqueness => true

  has_many :own_photos, :class_name => "Photo", :dependent => :destroy
  has_many :comments
  has_many :favorites

  has_many :favorite_photos, :through => :favorites, :source => :photo

  has_many :followings_where_follower, :class_name => "Following", :foreign_key => "follower_id"
  has_many :leaders, :through => :followings_where_follower, :source => :leader

  has_many :timeline, :through => :leaders, :source => :own_photos

  has_many :followings_where_leader, :class_name => "Following", :foreign_key => "leader_id"
  has_many :followers, :through => :followings_where_leader, :source => :follower




  # def followings_where_follower
  #   Following.where(:follower_id => self.id)
  # end

  # def leaders
  #   return followings_where_follower.map(&:leader)
  # end

  # def timeline
  #   photos = []

  #   leaders.each do |user|
  #     photos << user.own_photos
  #   end

  #   return photos.flatten
  # end





  # def followings_where_leader

  # end


  # def favorite_photos
  #   photos = []

  #   self.favorites.each do |favorite|
  #     photos << favorite.photo
  #   end

  #   return photos
  # end
end
