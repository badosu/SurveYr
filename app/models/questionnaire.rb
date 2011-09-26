class Questionnaire < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  has_many :questions, :dependent => :destroy

  accepts_nested_attributes_for :questions
end
