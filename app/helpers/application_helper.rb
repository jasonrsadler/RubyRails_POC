module ApplicationHelper
  def get_funds
    @fund = Fund.find_by(client_id: current_client.id)
    if @fund == nil
      return 0
    else
      return @fund.avail_amount.to_d / 100
    end
  end
end