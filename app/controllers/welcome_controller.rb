class WelcomeController < ApplicationController

  def index
    return unless current_user

    @latest_questionnaires = Questionnaire.watched_by current_user
    @questionnaires = Questionnaire.created_by current_user

    render :dashboard
  end

end
