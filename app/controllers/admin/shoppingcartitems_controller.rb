class Admin::ShoppingcartitemsController < Admin::BaseController
  
  before_action :set_shoppingcartitem, only: [:show, :edit, :update, :destroy]

  # GET /shoppingcartitems
  def index
    @shoppingcartitems = Shoppingcartitem.all
  end

#----------------------------------------------------------------------------
  # GET /shoppingcartitems/1
  def show
    @shoppingcartitem = Shoppingcartitem.find(params[:id])
    @user = User.find(@shoppingcartitem.user_id)
    @artwork = Artwork.find(@shoppingcartitem.artwork_id)
  end

  #----------------------------------------------------------------------------
    # GET /shoppingcartitems/1/edit
    def edit
      #@shoppingcartitem = Shoppingcartitem.find(params[:id])
    end

#----------------------------------------------------------------------------
  # POST /shoppingcartitems
  #def create
  #  @shoppingcartitem = Shoppingcartitem.new(shoppingcartitem_params)
  #  if @shoppingcartitem.save
  #    redirect_to @shoppingcartitem, notice: 'Shoppingcartitem was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end
  #----------------------------------------------------------------------------
    # PATCH/PUT /shoppingcartitems/1
    def update
      #@shoppingcartitem = Shoppingcartitem.find(params[:id])
      if @shoppingcartitem.update(shoppingcartitem_params)
        redirect_to @shoppingcartitem, notice: 'Shoppingcartitem was successfully updated.'
      else
        render action: 'edit'
      end
    end
#----------------------------------------------------------------------------
  # DELETE /shoppingcartitems/1
  def destroy
    @shoppingcartitem.destroy
    redirect_to admin_shoppingcartitems_url
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
