class Admin::SellersController < ApplicationController
  before_action :set_seller, only: [:show, :showreviews, :edit, :update, :destroy]

  # GET /sellers
  # GET /sellers.json
  def index
    @sellers = Seller.all
  end

#----------------------------------------------------------------------------
  # GET /sellers/1
  # GET /sellers/1.json
  def show
    #@seller = Seller.find(params[:id]) #already set
    @user = @seller.user
    @myartworks = Artwork.where(["seller_id = ?", @seller.id])
    @myreviews = Review.where(artwork_id: Artwork.where(seller: @seller))
  end
  
#----------------------------------------------------------------------------
  # GET /sellers/new
  def new
    # This action brings up a form but we don't need that
    #@seller = Seller.new
  end

#----------------------------------------------------------------------------
  # GET /sellers/1/edit
  def edit
    @seller = Seller.find(params[:id])
    @user = @seller.user
  end

#----------------------------------------------------------------------------
  # POST /sellers
  # POST /sellers.json
  def create
    @seller = Seller.new(seller_params)

    respond_to do |format|
      if @seller.save
        format.html { redirect_to @seller, notice: 'Seller was successfully created.' }
        format.json { render action: 'show', status: :created, location: @seller }
      else
        format.html { render action: 'new' }
        format.json { render json: @seller.errors, status: :unprocessable_entity }
      end
    end
  end

#----------------------------------------------------------------------------
  # PATCH/PUT /sellers/1
  # PATCH/PUT /sellers/1.json
  def update
    respond_to do |format|
      if @seller.update(seller_params)
        format.html { redirect_to admin_seller_url, notice: 'Seller was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @seller.errors, status: :unprocessable_entity }
      end
    end
  end

#----------------------------------------------------------------------------
  # DELETE /sellers/1
  # DELETE /sellers/1.json
  def destroy
    @seller.destroy
    respond_to do |format|
      format.html { redirect_to admin_sellers_url }
      format.json { head :no_content }
    end
  end

#----------------------------------------------------------------------------
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller
      @seller = Seller.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seller_params
      params.require(:seller).permit(:user_id, :seller_date, :displayed_name, :seller_description, :seller_email)
    end  
end
