class Admin::ArttagsController < ApplicationController
  before_action :set_arttag, only: [:update, :destroy]

  # GET /arttags
  def index
    @arttags = Arttag.all.order("id ASC")
    if params[:id]
      logger.debug "Got an id"
      @arttag = Arttag.find(params[:id])
    else
      logger.debug "No id"
      @arttag = Arttag.new
    end
      
#    @arttags = Arttag.all.order("id ASC")
#    if @arttag.nil?
#      @arttag = Arttag.new
#    else
#      @arttag = Arttag.find(params[:id]) if params[:id]
#    end
  end

#----------------------------------------------------------------------------
  # GET /arttags/1/edit
  #def edit
  #end

#----------------------------------------------------------------------------
  # GET /arttags/new
  #def new
  #  @arttag = Arttag.new
  #end
  
#----------------------------------------------------------------------------
  # POST /arttags
  def create
    @arttag = Arttag.new(arttag_params)
    if @arttag.save
      redirect_to admin_arttags_path, notice: 'Arttag was successfully created.'
    else
      render action: 'index'
    end 
  end

#----------------------------------------------------------------------------
  # PATCH/PUT /arttags/1
  def update
    if @arttag.update(arttag_params)
    #if @arttag = Arttag.find(params[:id])
      redirect_to admin_arttags_path, notice: 'Arttag was successfully updated.'
    else
      render action: 'index'
    end
    
  end

#----------------------------------------------------------------------------
  # DELETE /arttags/1
  def destroy
    @arttag.destroy
    redirect_to admin_arttags_url
  end

#----------------------------------------------------------------------------
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arttag
      @arttag = Arttag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arttag_params
      params.require(:arttag).permit(:tagname, :id)
    end
end
