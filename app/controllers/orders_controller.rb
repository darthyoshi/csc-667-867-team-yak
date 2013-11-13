class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

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
  end

#----------------------------------------------------------------------------
  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new
    @order.user_id = current_user.id
    @order.order_date = Time.now
    @order.shipping_address = current_user.shipping_address
    
    @order.save
    items = Shoppingcartitem.where(user_id: current_user.id)
    items.each do |item|
      orditem = Ordereditem.new
      aw = item.artwork
      orditem.order_id = @order.id
      orditem.sold_artwork_id = item.artwork_id
      orditem.quantity = item.quantity
      orditem.price = aw.price
      orditem.category = aw.category
      orditem.title = aw.title
      orditem.imagepath = aw.imagepath
      orditem.description = aw.description
      orditem.seller_name = aw.seller.displayed_name
      orditem.seller_email = aw.seller.seller_email
      orditem.save
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
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_date, :shipping_address, :shipping_cost)
    end
end
