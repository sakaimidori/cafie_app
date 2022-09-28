# frozen_string_literal: true

class Cafe::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    cafe_path
  end


  before_action :cafe_state, only: [:create]

  protected
  #退会している場合サインアップ画面に遷移させる
    def cafe_state
      @cafe = Cafe.find_by(email: params[:cafe][:email])
      return if !@cafe
      if @cafe.valid_password?(params[:cafe][:password]) && (@cafe.is_active == false)
        redirect_to new_cafe_registration_path
      end
    end





  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
