class SiteProceedsController < ApplicationController
  before_action :set_site_proceed, only: [:show, :edit, :update, :destroy]

  # GET /site_proceeds
  # GET /site_proceeds.json
  def index
    @site_proceeds = SiteProceed.all
  end

  # GET /site_proceeds/1
  # GET /site_proceeds/1.json
  def show
  end

  # GET /site_proceeds/new
  def new
    @site_proceed = SiteProceed.new
  end

  # GET /site_proceeds/1/edit
  def edit
  end

  # POST /site_proceeds
  # POST /site_proceeds.json
  def create
    @site_proceed = SiteProceed.new(site_proceed_params)

    respond_to do |format|
      if @site_proceed.save
        format.html { redirect_to @site_proceed, notice: 'Site proceed was successfully created.' }
        format.json { render :show, status: :created, location: @site_proceed }
      else
        format.html { render :new }
        format.json { render json: @site_proceed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_proceeds/1
  # PATCH/PUT /site_proceeds/1.json
  def update
    respond_to do |format|
      if @site_proceed.update(site_proceed_params)
        format.html { redirect_to @site_proceed, notice: 'Site proceed was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_proceed }
      else
        format.html { render :edit }
        format.json { render json: @site_proceed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_proceeds/1
  # DELETE /site_proceeds/1.json
  def destroy
    @site_proceed.destroy
    respond_to do |format|
      format.html { redirect_to site_proceeds_url, notice: 'Site proceed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_proceed
      @site_proceed = SiteProceed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_proceed_params
      params.require(:site_proceed).permit(:client_id, :provider_id, :counseling_session_id, :total_session_amount, :provider_amount, :commission_amount, :commission_percentage)
    end
end
