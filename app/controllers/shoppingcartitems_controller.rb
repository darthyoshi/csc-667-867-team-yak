class ShoppingcartitemsController < ApplicationController
  before_action :set_shoppingcartitem, only: [:destroy]
  
#----------------------------------------------------------------------------
  # GET /mycart
  # GET /mycart.json
  def mycart
    # Both ways work:
    #@myitems = Shoppingcartitem.where(user: current_user)
    @myitems = Shoppingcartitem.where(user_id: current_user.id)
  end

#----------------------------------------------------------------------------
  # POST /shoppingcartitems
  # POST /shoppingcartitems.json
  def create
    @shoppingcartitem = Shoppingcartitem.new(shoppingcartitem_params)

    respond_to do |format|
      if @shoppingcartitem.save
        format.html { redirect_to '/mycart' }
        format.json { render action: 'show', status: :created, location: @shoppingcartitem }
      else
        format.html { render action: 'new' }
        format.json { render json: @shoppingcartitem.errors, status: :unprocessable_entity }
      end
    end
  end

#----------------------------------------------------------------------------
  # DELETE /shoppingcartitems/1
  # DELETE /shoppingcartitems/1.json
  def destroy
    @shoppingcartitem.destroy
    respond_to do |format|
      format.html { redirect_to '/mycart' }
      format.json { head :no_content }
    end
  end

#----------------------------------------------------------------------------
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoppingcartitem
      @shoppingcartitem = Shoppingcartitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shoppingcartitem_params
      params.require(:shoppingcartitem).permit(:artwork_id, :user_id, :quantity)
    end
end
