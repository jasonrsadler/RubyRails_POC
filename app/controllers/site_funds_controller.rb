class SiteFundsController < ApplicationController
  before_action :set_site_fund, only: [:show, :edit, :update, :destroy]

  # GET /site_funds
  # GET /site_funds.json
  def index
    @site_funds = SiteFund.all
  end

  # GET /site_funds/1
  # GET /site_funds/1.json
  def show
  end

  # GET /site_funds/new
  def new
    @site_fund = SiteFund.new
  end

  # GET /site_funds/1/edit
  def edit
  end

  # POST /site_funds
  # POST /site_funds.json
  def create
    @site_fund = SiteFund.new(site_fund_params)

    respond_to do |format|
      if @site_fund.save
        format.html { redirect_to @site_fund, notice: 'Site fund was successfully created.' }
        format.json { render :show, status: :created, location: @site_fund }
      else
        format.html { render :new }
        format.json { render json: @site_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_funds/1
  # PATCH/PUT /site_funds/1.json
  def update
    respond_to do |format|
      if @site_fund.update(site_fund_params)
        format.html { redirect_to @site_fund, notice: 'Site fund was successfully updated.' }
        format.json { render :show, status: :ok, location: @site_fund }
      else
        format.html { render :edit }
        format.json { render json: @site_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_funds/1
  # DELETE /site_funds/1.json
  def destroy
    @site_fund.destroy
    respond_to do |format|
      format.html { redirect_to site_funds_url, notice: 'Site fund was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_fund
      @site_fund = SiteFund.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_fund_params
      params.require(:site_fund).permit(:avail_amount)
    end
end
