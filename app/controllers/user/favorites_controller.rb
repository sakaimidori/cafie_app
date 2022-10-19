class User::FavoritesController < ApplicationController

  def create
    cafe = Cafe.find(params[:cafe_id])

    favorite = current_user.favorites.new(cafe_id: cafe.id)
    favorite.save
    flash[:notice] = "お気に入りに保存しました"
    redirect_to cafe_path(cafe)
  end

  def destroy
    cafe = Cafe.find(params[:cafe_id])
    favorite = current_user.favorites.find_by(cafe_id: cafe.id)
    favorite.destroy
    flash[:notice] = "お気に入りから削除しました"
    redirect_to cafe_path(cafe)
  end
end
