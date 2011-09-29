class Question < ActiveRecord::Base
  belongs_to :questionnaire
  has_many :answers, :dependent => :destroy
  
  accepts_nested_attributes_for :answers, :reject_if => lambda {|f| f[:answer].blank?}, :allow_destroy => true
end
