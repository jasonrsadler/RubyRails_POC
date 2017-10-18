json.array!(@proceeds) do |proceed|
  json.extract! proceed, :id, :provider_id, :amount
  json.url proceed_url(proceed, format: :json)
end
