class UsersController < ApplicationController
  
  def show
  end

  def edit
  end
  
  def update
  end
  
  def index
    @users = User.all
    @user = User.first
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :image)  
  end
  
end
