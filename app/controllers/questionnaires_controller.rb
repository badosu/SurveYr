class QuestionnairesController < ApplicationController

  def new
  end

  def create
  end

  def index
    @user = User.find_by_id(params[:user_id])
    @questionnaires = @user.questionnaires
  end

  def update
  end

end
