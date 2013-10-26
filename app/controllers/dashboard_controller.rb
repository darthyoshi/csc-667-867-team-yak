class DashboardController < ApplicationController
  
  def index
    @images = ArtPiece.find(:all) 
  end
  
end
