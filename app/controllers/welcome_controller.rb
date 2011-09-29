class WelcomeController < ApplicationController

  def index
    return unless current_user

    @latest_questionnaires = Questionnaire.where(:is_public=>true).joins(:user => {:relationships => :followed}).where('relationships.follower_id = ?', current_user.id)
    @questionnaires = Questionnaire.where(:user_id => current_user.id)
    render :dashboard
  end

end
