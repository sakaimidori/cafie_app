class Cafes::HomesController < ApplicationController

  def top
    @cafe = current_cafe
  end
  
end
