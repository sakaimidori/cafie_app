class User::CafesController < ApplicationController

  def index
    gon.cafes = Cafe.where(is_active: true)
  end

  def show
    unless Cafe.find(params[:id]).is_active
      flash[:alert] = "ご指定のページは削除されました"
      redirect_to cafes_path
    end
    @cafe = Cafe.find(params[:id])
    gon.cafe = @cafe
    @review = Review.new
  end


end


