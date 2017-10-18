class EntriesController < ApplicationController
  before_filter do
    if current_provider != nil
      authenticate_provider!
    else
      authenticate_client!
    end
  end

  # GET /entries
  # GET /entries.json
  def index        
    if current_client
      @counseling_session = CounselingSession.find_by(client: current_client, in_progress: true, id: params[:counseling_session_id])
    elsif current_provider
      @counseling_session = CounselingSession.find_by(provider: current_provider, session_ended: false, id: params[:counseling_session_id])
    end
    if @counseling_session != nil
      @entries = Entry.where(counseling_session_id: @counseling_session.id).order(:id)
    else
      redirect_to root_path, alert: 'Session does not exist or is not accessible'
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  
  def entry_submit
    if current_client
      @counseling_session = CounselingSession.find_by(client: current_client, in_progress: true, id: params[:counseling_session_id])
    elsif current_provider
      @counseling_session = CounselingSession.find_by(provider: current_provider, in_progress:true, id: params[:counseling_session_id])
    end
    if @counseling_session != nil
      @entries = Entry.where(counseling_session_id: @counseling_session.id).order(:id)
    else
      redirect_to root_path, alert: 'Session does not exist or is not accessible'
    end
    params[:entry_text].gsub! "\n", ""
    @entry = Entry.new(entry_text: params[:entry_text], 
      client_id: @counseling_session.client_id, 
      counseling_session_id: @counseling_session.id,
      provider_id: @counseling_session.provider_id,
      entry_by_client: params[:entry_by_client],
      entry_by_provider: params[:entry_by_provider],
      answered: false)
    @entry.save!
    
    respond_to do |format|
      format.js
    end
    rescue => e
      logger.error e.message
  end
  
  def entry_get
    if current_client
      @counseling_session = CounselingSession.find_by(client: current_client, in_progress: true, id: params[:counseling_session_id])
      
    elsif current_provider
      @counseling_session = CounselingSession.find_by(provider: current_provider, in_progress:true, id: params[:counseling_session_id])
    end
    if @counseling_session != nil
      @entries = Entry.where(counseling_session_id: @counseling_session.id).order(:id)
    end
    
    respond_to do |format|
      if @counseling_session == nil && current_client
        format.js {render :js => "window.location.href='" + client_session_ended_path(counseling_session_id: params[:counseling_session_id]) + "'"}
      else
        format.js
      end
    end
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def end_session
    @counseling_session = CounselingSession.find_by(id: params[:counseling_session_id], charges_settled:false)
    if @counseling_session != nil
      if current_provider
        @counseling_session.make_provider_available
      end
      
      if @counseling_session.update_session_end
        render notice: 'Session has successfully ended'        
      end  
      
    else
      redirect_to :back, alert: "This charge has already been settled"
    end
  end
  
  

  private
    def entry_params
      params.require(:entry).permit(:entry_text, :client_id, :counseling_session_id, :provider_id, :entry_by_client, :entry_by_provider, :total_amount)
    end
end
