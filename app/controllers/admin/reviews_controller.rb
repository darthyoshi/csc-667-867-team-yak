class Admin::ReviewsController < Admin::BaseController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  def index
    @reviews = Review.all
  end

#----------------------------------------------------------------------------
  # GET /reviews/1
  def show
  end
  
#----------------------------------------------------------------------------
  def showreviews
    #@user = @seller.user
    #@myartworks = Artwork.where(["seller_id = ?", @seller.id])
    seller = params[:seller_id]
    #@myreviews = Review.where(artwork_id: Artwork.where(seller: seller))
    @myreviews = Review.reviews_for(artwork_id: Artwork.by_seller(seller))
  end
  
#----------------------------------------------------------------------------
  # GET /reviews/1/edit
  def edit
  end

#----------------------------------------------------------------------------
  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      redirect_to admin_review_url, notice: 'Review was successfully updated.'
    else
      render action: 'edit'
    end
  end

#----------------------------------------------------------------------------
  # DELETE /reviews/1
  def destroy
    @review.destroy
    redirect_to admin_reviews_url
  end

#----------------------------------------------------------------------------
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:stars, :review_text)
    end
end
