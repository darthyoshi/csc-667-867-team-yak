class Admin::ArttagsController < ApplicationController
  before_action :set_arttag, only: [:edit, :show, :update, :destroy]

  # GET /arttags
  def index
    @arttags = Arttag.all.order("id ASC")
  end

#----------------------------------------------------------------------------
  # GET /arttags/new
  def new
    @arttag = Arttag.new
  end

#----------------------------------------------------------------------------
  # GET /arttags/1/edit
  def edit
  end

#----------------------------------------------------------------------------
  # GET /arttags/1
  def show
  end
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
      redirect_to admin_arttag_path, notice: 'Arttag was successfully updated.'
    else
      render action: 'edit'
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
      params.require(:arttag).permit(:tagname)
    end
end
