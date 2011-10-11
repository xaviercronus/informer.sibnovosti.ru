class UsersController < ApplicationController
  load_and_authorize_resource  
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create params[:user]
    if @user.save
      redirect_to users_path, :notice => t(:user_successfully_created)
    else
      render :action => :new
    end
  end
end
