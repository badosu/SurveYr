class QuestionnairesController < ApplicationController
  def index
    @questionnaires = Questionnaire.created_by current_user
  end
  
  def show
    @questionnaire = Questionnaire.find params[:id]
  end
  
  def new
    @questionnaire = Questionnaire.new
    2.times do
      question = @questionnaire.questions.build
      2.times { question.answer_fields.build }
    end
  end
  
  def create
    @questionnaire = Questionnaire.new params[:questionnaire]
    @questionnaire.user = current_user

    render :new unless @questionnaire.save

    flash[:notice] = "Successfully created survey."
    redirect_to @questionnaire
      
  end
  
  def edit
    @questionnaire = Questionnaire.find(params[:id])
  end
  
  def update
    @questionnaire = Questionnaire.find(params[:id])

    render :action => 'edit' unless @questionnaire.update_attributes params[:questionnaire]

    flash[:notice] = "Successfully updated survey."
    redirect_to @questionnaire
      
  end
  
  def destroy
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire.destroy
    flash[:notice] = "Successfully removed survey."
    redirect_to questionnaires_url
  end
end
