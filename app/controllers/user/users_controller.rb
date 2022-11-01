class User::UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = current_user
     #Cafe.where(is_active: true)
    #cafe = Cafe.where(is_active: true)
    @favorites = @user.favorites
    @reviews = @user.reviews
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
