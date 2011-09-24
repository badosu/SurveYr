class UsersController < ApplicationController

  def new
    @user ||= User.new
  end

  def create
    @user = User.new params[:user]
    flash[:notice] = "Signed up!" if @user.save

    render "new"
  end



end
