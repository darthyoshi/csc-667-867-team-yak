class WelcomeController < ApplicationController
  
  def index
    @images = ArtPiece.find(:all) 
    if user_signed_in?
    end
  end
  
end
