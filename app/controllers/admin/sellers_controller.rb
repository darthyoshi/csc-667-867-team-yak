class Admin::SellersController < Admin::BaseController
  before_action :set_seller, only: [:show, :showreviews, :edit, :update, :destroy]

  # GET /sellers
  def index
    @sellers = Seller.all
  end

#----------------------------------------------------------------------------
  # GET /sellers/1
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
  def create
    @seller = Seller.new(seller_params)
    if @seller.save
      redirect_to @seller, notice: 'Seller was successfully created.'
    else
      render action: 'new'
    end
  end

#----------------------------------------------------------------------------
  # PATCH/PUT /sellers/1
  def update
    if @seller.update(seller_params)
      redirect_to admin_seller_url, notice: 'Seller was successfully updated.'
    else
      render action: 'edit'
    end
  end

#----------------------------------------------------------------------------
  # DELETE /sellers/1
  def destroy
    @seller.destroy
    redirect_to admin_sellers_url
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
