class Following < ActiveRecord::Base
  belongs_to :leader, :class_name => "User", :foreign_key => "leader_id"
  belongs_to :follower, :class_name => "User", :foreign_key => "follower_id"

  validates :follower, :uniqueness => { :scope => :leader, :message => "already follows this user" }, :presence => true
  validates :leader, :presence => true
end
