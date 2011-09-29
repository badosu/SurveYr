class QuestionnairesController < ApplicationController
  def index
    @questionnaires = Questionnaire.where :user_id => current_user.id
  end
  
  def show
    @questionnaire = Questionnaire.find params[:id]
  end
  
  def new
    @questionnaire = Questionnaire.new
    2.times do
      question = @questionnaire.questions.build
      2.times { question.answers.build }
    end
  end
  
  def create
    @questionnaire = Questionnaire.new params[:questionnaire]
    @questionnaire.user = current_user
    if @questionnaire.save
      flash[:notice] = "Successfully created survey."
      redirect_to @questionnaire
    else
      render :new
    end
  end
  
  def edit
    @questionnaire = Questionnaire.find(params[:id])
  end
  
  def update
    @questionnaire = Questionnaire.find(params[:id])
    if @questionnaire.update_attributes params[:questionnaire]
      flash[:notice] = "Successfully updated survey."
      redirect_to @questionnaire
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire.destroy
    flash[:notice] = "Successfully destroyed survey."
    redirect_to questionnaires_url
  end
end
