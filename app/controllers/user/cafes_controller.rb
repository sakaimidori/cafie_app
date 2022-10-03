class User::CafesController < ApplicationController

  def index
    gon.cafes = Cafe.all
  end

  def show
    @cafe = Cafe.find(params[:id])
    gon.cafe = @cafe
  end

end
