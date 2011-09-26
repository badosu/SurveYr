class User < ActiveRecord::Base

  has_secure_password

  mount_uploader :image, ImageUploader

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed
  has_many :reverse_relationships, :foreign_key => "followed_id", :class_name => "Relationship", :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower

  has_many :questionnaires, :dependent => :destroy

  validates :name, :uniqueness => {:case_sensitive => false}, :presence => true, :length => {:in => 5..15}

  validates :email, :uniqueness => {:case_sensitive => false}, :presence => true, :format => {:with => email_regex}

  validates :password, :presence => true, :length => {:in => 6..25}, :on => :create

end
