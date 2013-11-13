class Admin::ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]

  # GET /artworks
  # GET /artworks.json
  def index
    #@artworks = Artwork.all
    
    @artworks = Artwork.paginate(:page => params[:page], :per_page => 50)
  end
#----------------------------------------------------------------------------
  # GET /artworks/1
  # GET /artworks/1.json
  def show
    @artwork = Artwork.find(params[:id])
    @my_arttags = @artwork.arttags
    
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
    @artwork = Artwork.find(params[:id])
    @all_arttags = Arttag.all
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
  # PATCH/PUT /artworks/1
  # PATCH/PUT /artworks/1.json
  def update
    @artwork = Artwork.find(params[:id])
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
    
    respond_to do |format|
      if @artwork.update(artwork_params)
        format.html { redirect_to @artwork, notice: 'Artwork was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
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
