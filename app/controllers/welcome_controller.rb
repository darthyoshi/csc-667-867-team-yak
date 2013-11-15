class WelcomeController < ApplicationController
  
  def index
    if user_signed_in?
      @text = 'User is signed in.'
    else
      @text = 'User is not signed in.'
    end
    
    @artworks = Artwork.paginate(:page => params[:page], :per_page => 8)
  end
  
  def about
  end
  
  def contact
  end
  
  def faq
  end

end
