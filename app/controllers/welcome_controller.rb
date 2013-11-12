class WelcomeController < ApplicationController
  
  def index
    if user_signed_in?
      @text = 'User is signed in.'
    else
      @text = 'User is not sined in.'
    end
    
    #@artworks = Artwork.all
    @artworks = Artwork.paginate(:page => params[:page], :per_page => 8)
  end

  #----------------------------------------------------------------------------  
  def about
  end  
  
end
