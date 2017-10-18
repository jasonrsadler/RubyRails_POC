class PaymentsController < ApplicationController
before_action :authenticate_client!
  def index
    @fund = current_client.fund
    @payments = Payment.where(fund_id: @fund.id).order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def show
    @payment = Payment.find(params[:id])
    if @payment.fund != current_client.fund
      redirect_to payments_path
    else
      @charge = Stripe::Charge.retrieve(@payment.charge_token)
    end
    rescue => e
       redirect_to payments_path
  end  

  private
    def payment_params
      params[:payment]
    end
end
