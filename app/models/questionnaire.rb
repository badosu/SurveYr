class Questionnaire < ActiveRecord::Base

  belongs_to :user
  validates_presence_of :user, :name
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, :reject_if => :all_blank, :allow_destroy => true

end
