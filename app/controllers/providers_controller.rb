class ProvidersController < ApplicationController
  #before_action :authenticate_client!, except: [:show_profile_image, :index, :show]
  before_action :authenticate_provider!, except: [:show_profile_image, :index, :show, :session_options]
  def index
    @providers = Provider.joins("LEFT OUTER JOIN reviews ON reviews.provider_id = providers.id") \
      .where(public: true) \
      .group("providers.id")\
      .order(sort_order)\
      .paginate(page: params[:page], per_page: 10)
  end

  def show
    @provider = Provider.find(params[:id])
  end

  def show_profile_image
    @provider = Provider.find(params[:id])
    @image = @provider.profile_image
    send_data @image, type: 'image/png', disposition: 'inline'
  end
  
  def update
    @provider = Provider.find(params[:id])
    if @provider.update(status_params)
      redirect_to :back
      p "Saved"
    else
      p "Not Saved"
    end    
  end
  
  def session_options
    @provider = Provider.find(params[:provider_id])
  end

  
  private
  def status_params
    params.require(:provider).permit(:status)
  end

  def sort_order
    if params[:sort_by] == "Highest Rating"
      return "avg(reviews.rating) DESC NULLS LAST"
    elsif params[:sort_by] == "Lowest Rate"
      return "rate ASC NULLS LAST"
    elsif params[:sort_by] == "Availabile By Phone"
      return "service_by_phone DESC NULLS LAST"
    elsif params[:sort_by] == "Available By Chat"
      return "service_by_chat DESC NULLS LAST"
    elsif params[:sort_by] == "Available By Email"
      return "service_by_email DESC NULLS LAST"
    else
      return "avg(reviews.rating) DESC NULLS LAST"
    end    
  end
end
