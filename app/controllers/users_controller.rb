class UsersController < ApplicationController

  def new
    @user ||= User.new
  end

  def create
    @user = User.new params[:user]
    render :new unless @user.save
    session[:user_id] = @user.id

    redirect_to root_url
  end

  def show
    redirect_to root_url if current_user.id == params[:id].to_i

    @user = User.find_by_id params[:id]
    @questionnaires = @user.questionnaires.published
  end

  def index
    @users = User.all
  end

  def edit 
    @user = current_user
    redirect_to root_url unless current_user
    redirect_to :user unless params[:id].to_i == current_user.id
  end

  def update
    @user = current_user
    @user.attributes = params[:user]

    render :edit unless @user.save

    session[:user_id] = @user.id

    redirect_to root_url
  end

  def follow
    current_user.follow! User.find(params[:user_id])
  end

  def unfollow
    current_user.unfollow! User.find(params[:user_id])
  end

end
