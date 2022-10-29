class User::UsersController < ApplicationController

  def show
    @user = current_user
     #Cafe.where(is_active: true)
    #cafe = Cafe.where(is_active: true)
    @favorites = @user.favorites
    @reviews = @user.reviews
  end

  def edit
  end
end
