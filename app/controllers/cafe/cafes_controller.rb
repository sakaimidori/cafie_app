class Cafe::CafesController < ApplicationController

  before_action :authenticate_cafe!

  def edit
    @cafe = current_cafe
  end

  def update
    @cafe = current_cafe
    if @cafe.update(cafe_params)
      redirect_to cafe_path
    else
      render :edit
    end
  end


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
    params.require(:cafe).permit(:cafe_name, :phone_number, :address, :email, :business_hour, :fixed_holiday, :payment_method, :smoking, :introduce, :remarks, :latitude, :longitude, :congestion_status, cafe_images: [])
  end

end
