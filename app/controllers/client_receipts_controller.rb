class ClientReceiptsController < ApplicationController
  before_action :authenticate_client!

  def index
    @client_receipts = ClientReceipt.where(client: current_client).order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def show
    @client_receipt = ClientReceipt.find(params[:id])
  end
  
  def session_transcript
    if current_client
      @client_receipt = ClientReceipt.find_by(id: params[:id], client: current_client)
    end
    if @client_receipt == nil
      redirect_to root_path, alert: "Session is inaccessible"
      return
    end
    if current_client
      @counseling_session = CounselingSession.find_by(id: @client_receipt.counseling_session.id, client: current_client, provider: @client_receipt.provider)      
    elsif current_provider
      @counseling_session = CounselingSession.find_by(id: @client_receipt.counseling_session.id, client: @client_receipt.client, provider: current_provider)           
    end    
  end

  def new
    @client_receipt = ClientReceipt.new
  end

  def create
    @client_receipt = ClientReceipt.new(client_receipt_params)

    respond_to do |format|
      if @client_receipt.save
        format.html { redirect_to @client_receipt, notice: 'Client receipt was successfully created.' }
        format.json { render :show, status: :created, location: @client_receipt }
      else
        format.html { render :new }
        format.json { render json: @client_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @client_receipt.update(client_receipt_params)
        format.html { redirect_to @client_receipt, notice: 'Client receipt was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_receipt }
      else
        format.html { render :edit }
        format.json { render json: @client_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def client_receipt_params
      params[:client_receipt]
    end
end
