class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  after_filter :store_location

  

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get? 
    if (request.path != "/clients/sign_in" &&
        request.path != "/clients/sign_up" &&
        request.path != "/clients/password/new" &&
        request.path != "/clients/sign_out" &&
        request.path != "/providers/sign_in" &&
        request.path != "/providers/sign_up" &&
        request.path != "/providers/password/new" &&
        request.path != "/providers/sign_out" &&
        request.path != "/sites/sign_in" &&
        request.path != "/sites/sign_up" &&
        request.path != "/sites/password/new" &&
        request.path != "/sites/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end
  
  def after_sign_in_path_for(resource)
    if current_provider
      @provider = current_provider
      @provider.set_status_online
    end
    session[:previous_url] || root_path
  end
  
  def after_sign_out_path_for(resource)
    if current_provider
      @provider = current_provider
      @provider.set_status_offline
    end
    root_path
  end
end