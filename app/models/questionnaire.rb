class Questionnaire < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :user, :name
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda {|f| f[:question].blank?}, :allow_destroy => true

  has_many :followed_users, :primary_key => :user_id, :foreign_key => :followed_id, :class_name => "Relationship"

end
