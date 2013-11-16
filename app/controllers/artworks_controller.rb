class ArtworksController < ApplicationController
  # this sets up the @artwork variable for show and destroy actions
  before_action :set_artwork, only: [:show, :destroy]

  # GET /artworks
  # GET /artworks.json
  def index
    # don't show artworks whose quantity is 0, scope in artwork model
    @artworks = Artwork.available.paginate(:page => params[:page], :per_page => 10)
  end
#----------------------------------------------------------------------------
  # GET /artworks/1
  # GET /artworks/1.json
  def show
    #@artwork = Artwork.find(params[:id]) #@artwork variable is set up above
    @my_arttags = @artwork.arttags
  end  
  
#----------------------------------------------------------------------------
  # POST /artworks
  # POST /artworks.json
  def create
    @artwork = Artwork.new(artwork_params)
    params[:arttag_list].each do |tag|
      arttag = Arttag.find(tag)
      unless @artwork.arttags.include?(arttag)
        @artwork.arttags << arttag
      end
    end

    respond_to do |format|
      if @artwork.save
        format.html { redirect_to @artwork, notice: 'Artwork was successfully created.' }
        format.json { render action: 'show', status: :created, location: @artwork }
      else
        format.html { render action: 'new' }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

#----------------------------------------------------------------------------
  # DELETE /artworks/1
  # DELETE /artworks/1.json
  def destroy
    @artwork.destroy
    respond_to do |format|
      format.html { redirect_to artworks_url }
      format.json { head :no_content }
    end
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
