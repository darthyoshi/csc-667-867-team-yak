class Seller::ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]

  # GET /seller/artworks
  def index
    # show artworks even if quantity is 0, seller needs to know
    seller_id = current_user.seller.id
    @artworks = Artwork.by_seller(seller_id).paginate(:page => params[:page], :per_page => 10)
  end

#----------------------------------------------------------------------------
  # GET /seller/artworks/new
  def new
    @artwork = Artwork.new
  end  
#----------------------------------------------------------------------------
  # GET /seller/artworks/1
  def show
    @my_arttags = @artwork.arttags
  end  

#----------------------------------------------------------------------------
  # GET /seller/artworks/1/edit
  def edit
    @artwork = Artwork.find(params[:id])
    @all_arttags = Arttag.all
  end
  
#----------------------------------------------------------------------------
  # POST /seller/artworks
  def create
    @artwork = Artwork.new(artwork_params)
    arttaglist = params[:arttag_list]
    @artwork.seller_id = current_user.seller.id
    @artwork.imagepath = "Paintings/Abstract/new.jpg"
    
    if !arttaglist.nil?
      params[:arttag_list].each do |tag|
        arttag = Arttag.find(tag)
        unless @artwork.arttags.include?(arttag)
          @artwork.arttags << arttag
        end
      end
    end

    if @artwork.save
      redirect_to seller_artworks_url, notice: 'Artwork was successfully created.'
    else
      render action: 'new'
    end
  end

#----------------------------------------------------------------------------
  # PATCH/PUT /seller/artworks/1
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

    if @artwork.update(artwork_params)
      redirect_to seller_artwork_url, notice: 'Artwork was successfully updated.'
    else
      render action: 'edit'
    end  
  end

#----------------------------------------------------------------------------
  # DELETE /seller/artworks/1
  def destroy
    @artwork.destroy
    redirect_to seller_artworks_url
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
