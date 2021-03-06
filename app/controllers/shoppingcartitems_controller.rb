class ShoppingcartitemsController < ApplicationController
  before_action :set_shoppingcartitem, only: [:destroy]
  
#----------------------------------------------------------------------------
  # GET /yourcart
  def yourcart
    #@myitems = Shoppingcartitem.where(user_id: current_user.id)
    @myitems = Shoppingcartitem.users_items(current_user.id)
    # find arworks in myitems that have quantity 0
    # SELECT "artworks".* FROM "artworks" WHERE "artworks"."id" IN 
    # (SELECT artwork_id FROM "shoppingcartitems" WHERE "shoppingcartitems"."user_id" = 1) AND
    # "artworks"."quantity" = 0    
    @unavailableitems = Artwork.where(id: Shoppingcartitem.select('artwork_id').where(user_id: current_user.id)).where(quantity: 0)
  end

#----------------------------------------------------------------------------
  # POST /shoppingcartitems
  def create 
    # check if the item is already in the shopping cart   
    @shoppingcartitem = Shoppingcartitem.where(user_id: current_user).where(artwork_id: params[:shoppingcartitem][:artwork_id]).first
    
    if !@shoppingcartitem.nil?
      @shoppingcartitem.increment(:quantity)
    else  
      @shoppingcartitem = Shoppingcartitem.new(shoppingcartitem_params)
    end 

    if @shoppingcartitem.save
      redirect_to '/yourcart'
    else
      render action: 'new' 
    end
  end

#----------------------------------------------------------------------------
  # DELETE /shoppingcartitems/1
  def destroy
    @shoppingcartitem.destroy
    redirect_to '/yourcart'
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
