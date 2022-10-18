class User::CafesController < ApplicationController

  def index
    gon.cafes = Cafe.all
  end

  def show
    @cafe = Cafe.find(params[:id])
    gon.cafe = @cafe
    @menus = @cafe.menus
  end

end

#退会済み店舗は表示させない-------------
  #def index
  #  @cafes = Cafe.where(is_active: true)
  #end

  #def show
    #unless Cafe.find(params[:id]).is_active
      #redirect_to root_path, alert: "削除済みです"
    #end
  #end
#----------------------------------
