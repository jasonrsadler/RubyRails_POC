json.array!(@site_funds) do |site_fund|
  json.extract! site_fund, :id, :avail_amount
  json.url site_fund_url(site_fund, format: :json)
end
