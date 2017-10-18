class ProviderAlertsController < ApplicationController

  # GET /provider_alerts
  # GET /provider_alerts.json
  def index
    @provider_alerts = ProviderAlert.where(provider_id: current_provider.id).order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  # GET /provider_alerts/1
  # GET /provider_alerts/1.json
  def show
    @provider_alert = ProviderAlert.find_by(id: params[:id], provider: current_provider)
    if @provider_alert == nil
      redirect_to provider_alerts_path
    else
      @provider_alert.mark_as_read
    end
  end
  
  respond_to :json
  def get_alert_count
    @provider = current_provider
    if (@provider != nil)
      @provider_alerts = ProviderAlert.where(provider: current_provider, answered: false)
      render json: @provider_alerts.count
    end
  end

  # GET /provider_alerts/new
  def new
    @provider_alert = ProviderAlert.new
  end

  

  # POST /provider_alerts
  # POST /provider_alerts.json
  def create
    @provider_alert = ProviderAlert.new(provider_alert_params)

    respond_to do |format|
      if @provider_alert.save
        format.html { redirect_to @provider_alert, notice: 'Provider alert was successfully created.' }
        format.json { render :show, status: :created, location: @provider_alert }
      else
        format.html { render :new }
        format.json { render json: @provider_alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provider_alerts/1
  # PATCH/PUT /provider_alerts/1.json
  def update
    respond_to do |format|
      if @provider_alert.update(provider_alert_params)
        format.html { redirect_to @provider_alert, notice: 'Provider alert was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider_alert }
      else
        format.html { render :edit }
        format.json { render json: @provider_alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provider_alerts/1
  # DELETE /provider_alerts/1.json
  def destroy
    @provider_alert = ProviderAlert.find(params[:id])
    @provider_alert.destroy
    respond_to do |format|
      format.html { redirect_to provider_alerts_url, notice: 'Provider alert deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def provider_alert_params
      params.require(:provider_alert).permit(:provider_id_id, :client_id_id, :alert_text)
    end
end
