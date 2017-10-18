class CounselingSessionsController < ApplicationController
  before_filter do
    if current_provider != nil
      authenticate_provider!
    else
      authenticate_client!
    end
  end
  
def index
    @counseling_sessions = CounselingSession.all
  end

  def show
    @counseling_session = CounselingSession.find(params[:id])
    if @counseling_session.session_ended
      redirect_to root_path, alert: "Session is no longer available"
    end
    if !current_provider
      @provider = Provider.find(@counseling_session.provider.id)        
      @counseling_session.create_provider_alert(alert_subject: generate_alert_subject, alert_text: generate_alert_text, counseling_session: @counseling_session)
    else
      @provider = current_provider    
    end 
  end
  
  def generate_alert_subject
    if @counseling_session.session_type == 1
      alert_subject = "A client is requesting a chat counseling session"
    elsif @counseling_session.session_type == 2
      alert_subject = "A client is requesting an email counseling session"
    elsif @counseling_session.session_type == 3
      alert_subject = "A client is requesting a phone counseling session"
    end
    return alert_subject
  end
  
  def generate_alert_text
    alert_text = "A client has requested a "
    if @counseling_session.session_type == 1
      alert_text << " chat "
    elsif @counseling_session.session_type == 2
      alert_text << " email "
    elsif @counseling_session.session_type == 3
      alert_text << " phone "
    end
    alert_text << " counseling session with you. The session was created at " << @counseling_session.created_at.to_s << ". If you are able to accept this session and it is still available, you may join the session"
    return alert_text
  end

  def new  
    
    @provider = Provider.find(params[:provider_id])
    if (current_provider)
      @counseling_session = CounselingSession.find_by(id: params[:id], provider_id: current_provider.id)
    end
    if @counseling_session == nil
      @counseling_session = CounselingSession.new
      @counseling_session.session_type = params[:session_type]
    end
  end
  
  respond_to :json
  def provider_joined
    @counseling_session = CounselingSession.find(params[:id])
    render json: @counseling_session.provider_joined
  end

  
  def create
    @counseling_session = CounselingSession.new(counseling_session_params)
    @provider = Provider.find(@counseling_session.provider_id)  
    @counseling_session.adv_amount = @provider.rate
    @counseling_session.adv_units = @provider.unit        
    if @counseling_session.create_session
       redirect_to @counseling_session, notice: 'Counseling Session Created.' 
    else      
      render :new, locals: {provider_id: @counseling_session.provider_id}      
    end
  end
  
  def update
    if current_client
      @counseling_session = CounselingSession.find(params[:id])   
      if @counseling_session == nil
        @counseling_session = CounselingSession.new
        @counseling_session.client = current_client
        @entry = Entry.find_by(counseling_session_id: params[:id], client_id: current_client.id, entry_by_client: true)
        if @entry == nil
          if @counseling_session.begin_entry_trail(params[:provider_id])
            redirect_to entries_path(counseling_session_id: @counseling_session.id), notice: 'Session Started/In Progress'
          else
            redirect_to :new, flash: 'An Error Occurred Starting the Session'
          end
        end 
      elsif @counseling_session.session_ended
        redirect_to root_path, alert: 'Session does not exist or is unavailable'
      else
        if @counseling_session.update_client_joined
          redirect_to entries_path(counseling_session_id: @counseling_session.id), notice: 'Session Started/In Progress'
        else
          redirect_to root_path, flash: 'An Error Occurred Starting the Sesison'
        end
      end
         
    elsif (current_provider) #joining session with client waiting
      @counseling_session = CounselingSession.find(params[:id])
      @counseling_session.provider = current_provider
      @counseling_session.update_attributes(counseling_session_params)
      if @counseling_session.update_avail_and_join 
        redirect_to entries_path(counseling_session_id: @counseling_session.id), notice: 'Session Started/In Progress'
      else
        render :new
      end
    end
    rescue => e
      redirect_to counseling_session_path, notice: 'An Error Occurred Starting the Session' + e.inspect  
  end
  
  def session_ended
      if current_provider        
      @counseling_session = CounselingSession.find_by(provider: current_provider, id: params[:counseling_session_id], charges_settled: false)
      if @counseling_session != nil
        @counseling_session.alt_time_specified = params[:alt_time_specified]
        @counseling_session.alt_time = params[:alt_time]
        if @counseling_session.alt_time_specified == 1          
          @counseling_session.total_amount = @counseling_session.adv_amount * @counseling_session.alt_time
        end
        if @counseling_session.adv_units == "Hour"
          @counseling_session.total_amount /= 60
        end        
        @counseling_session.settle_charges        
      else
        redirect_to root_path, alert: 'Charges have already been settled for this session'
      end
    end
  end
  
  def client_session_ended
    if current_client
      @counseling_session = CounselingSession.find_by(id: params[:counseling_session_id], client: current_client)
      if @counseling_session != nil
        if @counseling_session.adv_units == "Minute"
          @counseling_session.total_amount = @counseling_session.adv_amount * @counseling_session.session_duration        
        end
      else
        redirect_to root_path, alert: "Inaccessible Session"
      end  
    end
  end
  
  private
    
    def counseling_session_params
      params.require(:counseling_session).permit(:client_id, :provider_id, :terms_of_service, :session_type, :alt_time, :alt_time_specified)
    end
end
