class WelcomeController < ApplicationController
  
  def index
#    @images = ArtPiece.find(:all) 
    @images = ArtPiece.all 
    if user_signed_in?
    end
  end
  
end
