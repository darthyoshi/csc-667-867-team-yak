class Admin::ArtworksController < Admin::BaseController
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]

  # GET /artworks
  def index
    @artworks = Artwork.order_by_id.paginate(:page => params[:page], :per_page => 50)
  end
#----------------------------------------------------------------------------
  # GET /artworks/1
  def show
    #@artwork = Artwork.find(params[:id])
    @my_arttags = @artwork.arttags
    # do I need that?
    @myreviews = @artwork.reviews
  end
#----------------------------------------------------------------------------
  # GET /artworks/new
  def new
    @artwork = Artwork.new 
    @all_arttags = Arttag.all #immediately queries the database, returns an Array
  end
#----------------------------------------------------------------------------
  # GET /artworks/1/edit
  def edit
    #@artwork = Artwork.find(params[:id])
    @all_arttags = Arttag.all
  end
#----------------------------------------------------------------------------
  # POST /artworks
  def create
    @artwork = Artwork.new(artwork_params)
    params[:arttag_list].each do |tag|
      arttag = Arttag.find(tag)
      unless @artwork.arttags.include?(arttag)
        @artwork.arttags << arttag
      end
    end
    
    if @artwork.save
      redirect_to @artwork, notice: 'Artwork was successfully created.'
    else  
      render action: 'edit'
    end

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
      redirect_to admin_artwork_path, notice: 'Artwork was successfully updated.'
    else  
      render action: 'edit'
    end    
    
  end
#----------------------------------------------------------------------------
  # DELETE /artworks/1
  def destroy
    #@artwork.destroy
    redirect_to admin_artworks_url
  end

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
