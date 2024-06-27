class UsersController < ApplicationController
  
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
  
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to @user
    else
      render :edit
    end
    
  end
  
  def index
    @users = User.all
    @user = User.new 
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :email)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path
    end
  end
  
end
