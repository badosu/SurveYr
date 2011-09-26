class Question < ActiveRecord::Base
  belongs_to :questionnaire
  validates_presence_of :questionnaire
  has_many :answers, :dependent => :destroy
  
end
