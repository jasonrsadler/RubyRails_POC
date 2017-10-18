json.array!(@site_proceeds) do |site_proceed|
  json.extract! site_proceed, :id, :client_id, :provider_id, :counseling_session_id, :total_session_amount, :provider_amount, :commission_amount, :commission_percentage
  json.url site_proceed_url(site_proceed, format: :json)
end
