class ArttagsController < ApplicationController
  before_action :set_arttag, only: [:show, :edit, :update, :destroy]

  # GET /arttags
  # GET /arttags.json
  def index
    @arttags = Arttag.all
  end

#----------------------------------------------------------------------------
  # GET /arttags/1
  # GET /arttags/1.json
  def show
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
  # POST /arttags
  # POST /arttags.json
  def create
    @arttag = Arttag.new(arttag_params)
    respond_to do |format|
      if @arttag.save
        format.html { redirect_to @arttag, notice: 'Arttag was successfully created.' }
        format.json { render action: 'show', status: :created, location: @arttag }
      else
        format.html { render action: 'new' }
        format.json { render json: @arttag.errors, status: :unprocessable_entity }
      end
    end
  end

#----------------------------------------------------------------------------
  # PATCH/PUT /arttags/1
  # PATCH/PUT /arttags/1.json
  def update
    respond_to do |format|
      if @arttag.update(arttag_params)
        format.html { redirect_to @arttag, notice: 'Arttag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @arttag.errors, status: :unprocessable_entity }
      end
    end
  end

#----------------------------------------------------------------------------
  # DELETE /arttags/1
  # DELETE /arttags/1.json
  def destroy
    @arttag.destroy
    respond_to do |format|
      format.html { redirect_to arttags_url }
      format.json { head :no_content }
    end
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
