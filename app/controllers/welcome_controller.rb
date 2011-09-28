class WelcomeController < ApplicationController

  def index
    render :dashboard if current_user
  end

  def dashboard
  end

end
