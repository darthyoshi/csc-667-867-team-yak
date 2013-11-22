class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :update, :destroy]

#----------------------------------------------------------------------------
  # GET /yourshop
 def yourshop
   @seller = Seller.where(["user_id = ?", current_user.id]).first
   @user = @seller.user
   @artworks = @seller.artworks
   # @reviews = @seller.reviews
 end

#----------------------------------------------------------------------------
  # GET /edityourshop
  def edityourshop
    @seller = Seller.where(["user_id = ?", current_user.id]).first
    @user = @seller.user
    @artworks = @seller.artworks
  end

#----------------------------------------------------------------------------
  # GET /sellers/new
  def new
    @seller = Seller.new
  end

#----------------------------------------------------------------------------
  # POST /sellers
  def create
    @seller = Seller.new(seller_params)
    @seller.user_id = current_user.id
    @seller.seller_date = Time.now #uses the server time
    
    # need to check if this seller already exists
    
    if @seller.save
    redirect_to @seller, notice: 'Your seller account was successfully created.'
    else
      render action: 'new'
    end
    
  end

#----------------------------------------------------------------------------
  # PATCH/PUT /sellers/1
  def update
    if @seller.update(seller_params)
      redirect_to @seller, notice: 'Seller was successfully updated.'
    else
      render action: 'edit'
    end
  end

#----------------------------------------------------------------------------
  # DELETE /sellers/1
  def destroy
    # seller_ids of artworks must be nullified
    @seller.destroy
    redirect_to welcome_url
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
