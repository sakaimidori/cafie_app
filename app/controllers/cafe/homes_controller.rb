class Cafe::HomesController < ApplicationController

  before_action :authenticate_cafe!

  def top
    @cafe = current_cafe
  end

end
