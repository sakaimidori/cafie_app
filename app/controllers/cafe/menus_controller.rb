class Cafe::MenusController < ApplicationController

  def index #メニュー一覧画面、メニュー新規登録画面
    @menu = Menu.new
    @cafe = current_cafe
    @menus = @cafe.menus
  end

  def create
    @menu = Menu.new(menus_params)
    @menu.cafe = current_cafe
    @menu.save
    redirect_to cafe_menus_path
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update(menus_params)
    redirect_to cafe_menus_path
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to cafe_menus_path
  end

  private

  def menus_params
    params.require(:menu).permit(:menu_name, :price)
  end
end