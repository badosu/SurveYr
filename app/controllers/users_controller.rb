class UsersController < ApplicationController

  def new
    @user ||= User.new
  end

  def create
    @user = User.new params[:user]
    render :new unless @user.save
    session[:user_id] = @user.id

    redirect_to @user
  end

  def show
    redirect_to root_url if current_user.id == params[:id].to_i

    @user = User.find_by_id params[:id]
    @questionnaires = @user.questionnaires.where(:is_public => true)
  end

  def index
    @users = User.all
  end

  def edit 
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
    render 'follow.js.coffee.erb', :layout => false if request.xhr?
  end

  def unfollow
    current_user.unfollow! User.find(params[:user_id])
    render 'unfollow.js.coffee.erb', :layout => false if request.xhr?
  end

end
