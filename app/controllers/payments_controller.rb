class PaymentsController < ApplicationController
  
  before_action :set_payment, only: [:show]
    
  def new
    @payment = Payment.new
  end
  
  def create
    @payment = Payment.new(payment_params)
    if @payment.save
        flash[:notice] = "Payment was created successfully."
        redirect_to payments_path
    else
       render 'new' 
    end
  end
  
  def show
  end
  
  private
    
  def payment_params
    params.require(:payment).permit(:amount, :card_expiry, :first_name, :last_name, :cvv, :card_number)
  end
  
  def set_payment
    @payment = Payment.find(params[:id])
  end
end
