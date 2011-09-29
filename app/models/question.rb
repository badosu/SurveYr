class Question < ActiveRecord::Base
  belongs_to :questionnaire
  validates_presence_of :question
  has_many :answers, :dependent => :destroy
  
  accepts_nested_attributes_for :answers, :reject_if => :all_blank, :allow_destroy => true
end
