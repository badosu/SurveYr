class Questionnaires::AnswerFormsController < ApplicationController
  def new
    @answer_form = AnswerForm.new
    @answer_form.user = current_user
    @answer_form.questionnaire = Questionnaire.find_by_id params[:questionnaire_id]
  end

  def create 
    render :new
  end
end
