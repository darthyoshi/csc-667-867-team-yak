class ArtworksController < ApplicationController
  # this sets up the @artwork variable for show and destroy actions
  before_action :set_artwork, only: [:show, :edit,  :update, :destroy]

  # GET /artworks
  def index
    
    if current_user.try(:admin?)
    	redirect_to admin_menu_index_url
    end
     
      # don't show artworks whose quantity is 0, scope in artwork model
      #@artworks = Artwork.available.paginate(:page => params[:page], :per_page => 10)
      page = params[:page].to_i
      if page.blank? or page == 0
        page = 1
      end
      
      @artworks = WillPaginate::Collection.create(page, 10) do |pager|
        if (! params[:tag].blank?)
          result = Arttag.find(params[:tag]).artworks
        elsif (! params[:morelike].blank?)
          result = Artwork.more_like(params[:morelike]).to_a
        else
          result = Artwork.available.all(:limit => pager.per_page, :offset => ((page - 1) * pager.per_page))
        end
        # inject the result array into the paginated collection:
        pager.replace(result)

        unless pager.total_entries
          # the pager didn't manage to guess the total count, do it manually
          pager.total_entries = Artwork.count
        end
      end
  end

#----------------------------------------------------------------------------
  # GET /artworks/1
  def show
    #@artwork = Artwork.find(params[:id])    
    @my_arttags = @artwork.arttags
  end  
#----------------------------------------------------------------------------
  # GET /artworks/1/edit
  def edit
    #@artwork = Artwork.find(params[:id])    
  end
#----------------------------------------------------------------------------
  # PATCH/PUT /artworks/1
  def update
    #@artwork = Artwork.find(params[:id])
    @all_arttags = Arttag.all
    checked_arttags = []

    checked_params = params[:arttag_list] || [] #we can't loop over nil
    checked_params.each do |tag|
      arttag = Arttag.find(tag)
      unless @artwork.arttags.include?(arttag)
        @artwork.arttags << arttag
      end
      checked_arttags << arttag
    end
    missing_arttags = @all_arttags - checked_arttags
    missing_arttags.each do |tag|
      if @artwork.arttags.include?(tag)
        @artwork.arttags.delete(tag)
      end
    end

    if @artwork.update(artwork_params)
      redirect_to admin_artwork_url, notice: 'Artwork was successfully updated.' 
    else
      render action: 'edit'
    end
    
  end
#----------------------------------------------------------------------------
  # DELETE /artworks/1
  #def destroy
  #  @artwork.destroy
  #  redirect_to artworks_url
  #end

#----------------------------------------------------------------------------
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artwork
      @artwork = Artwork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artwork_params
      params.require(:artwork).permit(:category, :title, :price, :quantity, :imagepath, :description, :arttag_list)
    end
end
