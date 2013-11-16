class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @myorders = Order.where(user_id: current_user.id)
  end

#----------------------------------------------------------------------------
  # GET /orders/1
  # GET /orders/1.json
  def show
    #@order = Order.find(params[:id]) #@order is already set up above
    @user = @order.user
  end

#----------------------------------------------------------------------------
  # GET /orders/new
  def new
    @order = Order.new
    @order.ordereditems.build
  end

#----------------------------------------------------------------------------
  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new
    @order.user_id = current_user.id
    @order.order_date = Time.now
    @order.shipping_address = current_user.shipping_address
    # Verify that all items in shopping cart are available
    items = Shoppingcartitem.users_items(current_user.id)
    items.each do |item|
      artwork = Artwork.find(item.artwork_id)
      if artwork.quantity < 1
        # return to the shopping cart
        redirect_to '/yourcart', notice: 'Item out of stock' and return
      end
    end
    
    if @order.save
      items.each do |item|
        orditem = Ordereditem.new
        aw = item.artwork
        orditem.order_id = @order.id
        orditem.sold_artwork_id = item.artwork_id
        orditem.price = aw.price
        orditem.category = aw.category
        orditem.title = aw.title
        orditem.imagepath = aw.imagepath
        orditem.description = aw.description
        orditem.seller_name = aw.seller.displayed_name
        orditem.seller_email = aw.seller.seller_email
        aw.decrement(:quantity).save # decrement the quantity
        orditem.quantity = item.quantity
        orditem.save
      end
      items.each do |item|
        item.destroy
      end
    end
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
 
  #----------------------------------------------------------------------------
  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update

    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end  
#----------------------------------------------------------------------------
  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
#----------------------------------------------------------------------------
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:id, :order_date, :shipping_cost, ordereditems_attributes: [:id, :order_id, :sold_artwork_id, :quantity, :price, :category, :title, :imagepath, :description, :seller_name, :seller_email])
    end
end
