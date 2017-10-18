class Fund < ActiveRecord::Base
  belongs_to :client  
  has_many :payments
  attr_accessor :stripe_card_token
  cattr_accessor :amount, :prev, :method_of_payment
  validates_numericality_of :amount, greater_than_or_equal_to: 10, message: " minimum is $10"
  validates_presence_of :method_of_payment, message: " must be indicated.", on: [:edit, :update] 
  
  def save_with_payment
    if valid?     
      final_amount = (amount.to_d * 100).to_i
      customer = Stripe::Customer.create(email: self.client.email, card: stripe_card_token)
      charge = Stripe::Charge.create(
        amount: final_amount,
        currency: "usd",
        customer: customer.id,
        description: "Account Funding"
      )
      
      self.stripe_customer_token = customer.id   
      self.avail_amount = final_amount      
      save!      
      create_payment(charge.id)
    end
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false  
    rescue Stripe::CardError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, e.message.to_s
      false   
  end
  
  def update_with_payment
    if valid?
      final_amount = (amount.to_d * 100).to_i
      if method_of_payment == "update"
        customer = Stripe::Customer.retrieve(self.stripe_customer_token)      
        charge = Stripe::Charge.create(
        card: prev,
        amount: final_amount,
        currency: "usd",
        customer: stripe_customer_token,
        description: "Account Funding"
      )
      else
        customer = Stripe::Customer.retrieve(self.stripe_customer_token)  
        new_card = customer.cards.create(card: stripe_card_token)
        charge = Stripe::Charge.create(
        card: new_card,
        amount: final_amount,
        currency: "usd",
        customer: stripe_customer_token,
        description: "Account Funding"
        )
      end
      self.avail_amount = (self.avail_amount + final_amount)
      save!
      create_payment(charge.id)
    end
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false  
    rescue Stripe::CardError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, e.message.to_s
      false 
  end
  
  private
  def create_payment(charge_id)
    @payment = Payment.new
    @payment.fund_id = self.id
    @payment.amount = self.amount
    @payment.charge_token = charge_id
    @payment.save!   
  end
end


