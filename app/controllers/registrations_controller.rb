class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, if: :devise_controller?
  

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, \
      :password, :password_confirmation, :first_name, :last_name, :zip, \
      :birthdate, :humanizer_answer, :humanizer_question_id, :address1, \
      :address2, :city, :state, :phone, :alt_phone, :terms_of_service) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, \
      :password, :password_confirmation, :first_name, :last_name, :zip, \
      :current_password, :profile_img, :rate, :unit, :summary, :address1, \
      :address2, :city, :state, :phone, :alt_phone, :service_by_phone, \
      :service_by_chat, :service_by_email, :public) }
  end
  
  

end
