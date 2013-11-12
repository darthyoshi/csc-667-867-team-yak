class SellersController < ApplicationController
  before_action :set_seller, only: [:update, :destroy]

#----------------------------------------------------------------------------
 def yourshop
   @seller = Seller.where(["user_id = ?", current_user.id]).first
   @user = @seller.user
   @artworks = @seller.artworks
   #@reviews = @seller.reviews
 end

#----------------------------------------------------------------------------
  def edityourshop
    @seller = Seller.where(["user_id = ?", current_user.id]).first
    @user = @seller.user
    @artworks = @seller.artworks
  end

#----------------------------------------------------------------------------
  # POST /sellers
  # POST /sellers.json
  def create
    @seller = Seller.new(seller_params)

    respond_to do |format|
      if @seller.save
        format.html { redirect_to @seller, notice: 'Seller was successfully created.' }
        format.json { render action: 'myselleraccount', status: :created, location: @seller }
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
        format.html { redirect_to @seller, notice: 'Seller was successfully updated.' }
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
      format.html { redirect_to sellers_url }
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
