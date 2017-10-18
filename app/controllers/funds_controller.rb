class FundsController < ApplicationController
  attr_accessor :stripe_customer_token
  before_action :authenticate_client!
  def new
    @fund = Fund.find_by(client_id: current_client.id)
    if @fund != nil
      redirect_to edit_fund_path(@fund)
    end
    @fund = Fund.new
    @fund.client = current_client
  end
  
  def show
    
  end
  
  def index
    @fund = Fund.find_by(client_id: current_client.id)
  end  
  
  def edit
    @fund = current_client.fund
    @cards = Stripe::Customer.retrieve(@fund.stripe_customer_token).cards.all(:limit => 3)
  end

  def update
    @fund = current_client.fund
    @fund.update_attributes(fund_params)
    
    if @fund.update_with_payment
      redirect_to funds_path, notice: ("Payment of $" + @fund.amount.to_s + " Successful")
    else
      @cards = Stripe::Customer.retrieve(@fund.stripe_customer_token).cards.all(:limit => 3)
      render :edit
    end
  end

  def create
    @fund = Fund.new(fund_params)
    @fund.client = current_client
    if @fund.save_with_payment
      redirect_to funds_path, notice: "Payment of $" + @fund.amount.to_s() + " Successful"
    else
      render :new
    end
  end

  def funds_required
    @fund = current_client.fund
    if @fund == nil
      @fund = Fund.new
      @fund.client = current_client
      p "new"
    else
      p "exist"
    end
  end

  private

  def fund_params
    params.require(:fund).permit(:stripe_card_token, :amount, :prev, :method_of_payment)
  end
end


