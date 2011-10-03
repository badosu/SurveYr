class AnswerForm < ActiveRecord::Base
  belongs_to :questionnaire
  belongs_to :user
  has_many :questions, :through => :questionnaire
  #has_many :answer_fields, :through => :questions
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers
end
