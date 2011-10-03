class Users::QuestionnairesController < ApplicationController
  def index
    @user = User.find_by_id params[:user_id]
    @questionnaires = Questionnaire.published_by @user
  end
end
