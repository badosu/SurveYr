class Question < ActiveRecord::Base
  belongs_to :questionnaire

  has_many :answer_fields, :dependent => :destroy

  has_many :answers, :through => :answer_fields
  
  accepts_nested_attributes_for :answer_fields, :reject_if => lambda {|f| f[:answer].blank?}, :allow_destroy => true
end
