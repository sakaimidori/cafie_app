class Cafe::CafesController < ApplicationController

  def edit
    @cafe = current_cafe
  end

  def update
    @cafe = current_cafe
    @cafe.update(cafe_params)
    redirect_to cafe_path
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
#-------------------------------------

  def confirm

  end

  def withdraw
    @cafe = current_cafe
    @cafe.update(is_active: false)
    reset_session
    redirect_to new_cafe_registration_path
  end




  private

  def cafe_params
    params.require(:cafe).permit(:cafe_name, :phone_number, :address, :email, :business_hour, :fixed_holiday, :payment_method, :smoking, :introduce, :remarks)
  end

end
