class Answer < ActiveRecord::Base
  belongs_to :answer_form
  belongs_to :answer_field
end
