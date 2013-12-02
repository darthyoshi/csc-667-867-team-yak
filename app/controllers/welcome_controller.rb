class WelcomeController < ApplicationController
  
  def index
    if user_signed_in?
      @msg = 'User is signed in.'
    else
      @msg = 'User is not signed in.'
    end
    
    @artworks = Artwork.paginate(:page => params[:page], :per_page => 10)
  end
  
  def about
  end
  
  def contact
  end
  
  def faq
  end

end
