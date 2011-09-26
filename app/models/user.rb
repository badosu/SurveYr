class User < ActiveRecord::Base

  has_secure_password

  has_many :questionnaires, :dependent => :destroy

  mount_uploader :image, ImageUploader

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :uniqueness => {:case_sensitive => false}, :presence => true, :length => {:in => 5..15}

  validates :email, :uniqueness => {:case_sensitive => false}, :presence => true, :format => {:with => email_regex}

  validates :password, :presence => true, :length => {:in => 6..25}, :on => :create

end
