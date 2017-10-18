Rails.application.routes.draw do

  resources :site_proceeds

  resources :site_funds

  resources :provider_funds
  resources :client_receipts
  resources :proceeds
  devise_for :clients, :controllers => {registrations: 'registrations'}
  devise_for :providers,  :controllers => {registrations: 'registrations'}
  devise_for :sites, :controllers => {registrations: 'registrations'}
   resources :provider_alerts
   resources :entries
   resources :payments
   resources :counseling_sessions
   resources :sites
   resources :providers do
     resources :reviews
  end
   resources :funds do
     resources :payments
  end
   root 'home#index'
   get 'provider_terms' => 'provider_terms_of_use#index'
   get 'privacy' => 'privacy_policy#index'
   get 'terms' => 'terms_of_use#index'
   get 'funds_required' => 'funds#funds_required'
   get 'funds_submit' => 'funds#funds_submit'
   post 'funds_submit' => 'funds#funds_submit'
   get 'providers/:id/show_profile_image' => 'providers#show_profile_image'
   get 'funds/confirm' => 'funds#confirm', via: [:get, :post]
   get 'counseling_sess/provider_joined/:id' => 'counseling_sessions#provider_joined', as: :provider_joined
   post 'entr/entry_submit' => 'entries#entry_submit', as: :entry_submit
   post 'entr/entry_get' => 'entries#entry_get', as: :entry_get
   get 'provs/session_options' => 'providers#session_options', as: :session_options
   get 'prov_alerts/get_alert_count' => 'provider_alerts#get_alert_count', as: :get_alert_count
   post 'entr/end_session' => 'entries#end_session', as: :end_session
   post 'counseling_sess/session_ended' => 'counseling_sessions#session_ended', as: :session_ended
   get 'counseling_sess/charges_settled' => 'counseling_sessions#charges_settled', as: :charges_settled
   get 'counseling_sess/client_session_ended' => 'counseling_sessions#client_session_ended', as: :client_session_ended
   get 'client_rec/session_transcript' => 'client_receipts#session_transcript', as: :session_transcript
# Example of regular route:
#   get 'products/:id' => 'catalog#view'

# Example of named route that can be invoked with purchase_url(id: product.id)
#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

# Example resource route (maps HTTP verbs to controller actions automatically):
#   resources :products

# Example resource route with options:
#   resources :products do
#     member do
#       get 'short'
#       post 'toggle'
#     end
#
#     collection do
#       get 'sold'
#     end
#   end

# Example resource route with sub-resources:
#   resources :products do
#     resources :comments, :sales
#     resource :seller
#   end

# Example resource route with more complex sub-resources:
#   resources :products do
#     resources :comments
#     resources :sales do
#       get 'recent', on: :collection
#     end
#   end

# Example resource route with concerns:
#   concern :toggleable do
#     post 'toggle'
#   end
#   resources :posts, concerns: :toggleable
#   resources :photos, concerns: :toggleable

# Example resource route within a namespace:
#   namespace :admin do
#     # Directs /admin/products/* to Admin::ProductsController
#     # (app/controllers/admin/products_controller.rb)
#     resources :products
#   end
end
