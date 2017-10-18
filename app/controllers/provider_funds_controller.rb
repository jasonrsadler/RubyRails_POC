class ProviderFundsController < ApplicationController
  before_action :set_provider_fund, only: [:show, :edit, :update, :destroy]

  # GET /provider_funds
  # GET /provider_funds.json
  def index
    @provider_funds = ProviderFund.all
  end

  # GET /provider_funds/1
  # GET /provider_funds/1.json
  def show
  end

  # GET /provider_funds/new
  def new
    @provider_fund = ProviderFund.new
  end

  # GET /provider_funds/1/edit
  def edit
  end

  # POST /provider_funds
  # POST /provider_funds.json
  def create
    @provider_fund = ProviderFund.new(provider_fund_params)

    respond_to do |format|
      if @provider_fund.save
        format.html { redirect_to @provider_fund, notice: 'Provider fund was successfully created.' }
        format.json { render :show, status: :created, location: @provider_fund }
      else
        format.html { render :new }
        format.json { render json: @provider_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provider_funds/1
  # PATCH/PUT /provider_funds/1.json
  def update
    respond_to do |format|
      if @provider_fund.update(provider_fund_params)
        format.html { redirect_to @provider_fund, notice: 'Provider fund was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider_fund }
      else
        format.html { render :edit }
        format.json { render json: @provider_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provider_funds/1
  # DELETE /provider_funds/1.json
  def destroy
    @provider_fund.destroy
    respond_to do |format|
      format.html { redirect_to provider_funds_url, notice: 'Provider fund was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider_fund
      @provider_fund = ProviderFund.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_fund_params
      params[:provider_fund]
    end
end
