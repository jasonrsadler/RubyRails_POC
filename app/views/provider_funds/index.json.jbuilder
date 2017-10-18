json.array!(@provider_funds) do |provider_fund|
  json.extract! provider_fund, :id
  json.url provider_fund_url(provider_fund, format: :json)
end
