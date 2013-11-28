class Admin::OrdersController < Admin::BaseController
  
  before_action :set_order, only: [:show]

  # GET /orders
  def index
    @orders = Order.all
  end

#----------------------------------------------------------------------------
  # GET /orders/1
  def show
    #@order = Order.find(params[:id])
    @user = @order.user
  end

#----------------------------------------------------------------------------
  # GET /orders/new
#  def new
#    @order = Order.new
#  end

#----------------------------------------------------------------------------
  # POST /orders
#  def create
#    @order = Order.new(order_params)

#    respond_to do |format|
#      if @order.save
#        format.html { redirect_to @order, notice: 'Order was successfully created.' }
#        format.json { render action: 'show', status: :created, location: @order }
#      else
#        format.html { render action: 'new' }
#        format.json { render json: @order.errors, status: :unprocessable_entity }
#      end
#    end
#  end
  
#----------------------------------------------------------------------------
  # GET /orders/1/edit
#  def edit
    #@order = Order.find(params[:id])
#    @useraddress = @order.shipping_address
#  end

#----------------------------------------------------------------------------
  # PATCH/PUT /orders/1
#  def update
#    user = User.find_by(id: @order.user_id)
# how do I get shipping address back from the edit form?
#    user.update(shipping_address: "test")
    
#    if @order.update(order_params)
#      redirect_to admin_order_url, notice: 'Order was successfully updated.'
#    else
#      format.html { render action: 'edit' }
#    end    
#  end

#----------------------------------------------------------------------------
  # DELETE /orders/1
  #def destroy
  #  @order.destroy
  #  redirect_to admin_orders_url
  #end

#----------------------------------------------------------------------------
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      #params.require(:order).permit(:user_id, :order_date, :shipping_cost)
      params.require(:order).permit(:user_id, :order_date, :shipping_cost)
      
    end
end
