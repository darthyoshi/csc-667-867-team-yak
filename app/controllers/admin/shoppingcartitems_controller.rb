class Admin::ShoppingcartitemsController < ApplicationController
  
  before_action :set_shoppingcartitem, only: [:show, :edit, :update, :destroy]

  # GET /shoppingcartitems
  # GET /shoppingcartitems.json
  def index
    @shoppingcartitems = Shoppingcartitem.all
  end

#----------------------------------------------------------------------------
  # GET /shoppingcartitems/1
  # GET /shoppingcartitems/1.json
  def show
    #@shoppingcartitem = Shoppingcartitem.find(params[:id])
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
  # POST /shoppingcartitems.json
  def create
    @shoppingcartitem = Shoppingcartitem.new(shoppingcartitem_params)

    respond_to do |format|
      if @shoppingcartitem.save
        format.html { redirect_to @shoppingcartitem, notice: 'Shoppingcartitem was successfully created.' }
        format.json { render action: 'show', status: :created, location: @shoppingcartitem }
      else
        format.html { render action: 'new' }
        format.json { render json: @shoppingcartitem.errors, status: :unprocessable_entity }
      end
    end
  end
  #----------------------------------------------------------------------------
    # PATCH/PUT /shoppingcartitems/1
    # PATCH/PUT /shoppingcartitems/1.json
    def update
      #@shoppingcartitem = Shoppingcartitem.find(params[:id])
      
      respond_to do |format|
        if @shoppingcartitem.update(shoppingcartitem_params)
          format.html { redirect_to @shoppingcartitem, notice: 'Shoppingcartitem was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
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
      format.html { redirect_to shoppingcartitems_url }
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
