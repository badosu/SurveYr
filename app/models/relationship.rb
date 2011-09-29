class Relationship < ActiveRecord::Base
  attr_accessible :followed_id

  belongs_to :follower, :class_name => "User"
  belongs_to :followed, :class_name => "User"
  validates_presence_of :follower_id, :followed_id
  validates_uniqueness_of :follower_id, :scope => :followed_id
end
