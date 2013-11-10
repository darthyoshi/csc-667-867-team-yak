class WelcomeController < ApplicationController
  
  def index
    # if user_signed_in?
    
    #@artworks = Artwork.all
    @artworks = Artwork.paginate(:page => params[:page], :per_page => 8)
  end
#----------------------------------------------------------------------------  
  def show
    @artwork = Artwork.find(params[:id])
  end
#----------------------------------------------------------------------------  
  def add_to_cart
  end
#----------------------------------------------------------------------------  
  def show_cart
  end
  
end
