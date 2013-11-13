class OrdereditemsController < ApplicationController
  #before_filter :get_order #probably don't need this
  before_action :set_ordereditem, only: [:create, :destroy]    

  # POST /ordereditems
  # POST /ordereditems.json
  def create
    @ordereditem = Ordereditem.new(ordereditem_params)   
    respond_to do |format|
      if @ordereditem.save
        format.html { redirect_to @ordereditem, notice: 'Ordereditem was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ordereditem }
      else
        format.html { render action: 'new' }
        format.json { render json: @ordereditem.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /ordereditems/1
  # DELETE /ordereditems/1.json
  def destroy
    @ordereditem.destroy
    respond_to do |format|
      format.html { redirect_to ordereditems_url }
      format.json { head :no_content }
    end
  end
  
#----------------------------------------------------------------------------------
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordereditem
      @ordereditem = Ordereditem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordereditem_params
      params.require(:ordereditem).permit(:order_id, :sold_artwork_id, :quantity, :price, :category, :title, :imagepath, :description, :seller_name, :seller_email)
    end
end
