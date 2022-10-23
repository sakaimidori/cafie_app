class User::CafesController < ApplicationController

  def index
    gon.cafes = Cafe.where(is_active: true)
  end

  def show
    unless Cafe.find(params[:id]).is_active
      flash[:alert] = "ご指定のページが見つかりません"
      redirect_to cafes_path
    end
    @cafe = Cafe.find(params[:id])
    gon.cafe = @cafe
    @menus = @cafe.menus
    @reviews = @cafe.reviews
  end

end


