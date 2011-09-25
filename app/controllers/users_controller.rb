class UsersController < ApplicationController

  def new
    @user ||= User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Signed up!" 
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = current_user
    redirect_to "sessions#new" unless @user
  end

end
