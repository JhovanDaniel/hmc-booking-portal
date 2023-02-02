class PaymentsController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_payment, only: [:show]
    
  def new
    @payment = Payment.new
  end
  
  def create
    @payment = Payment.new(payment_params)
    @payment.amount = 
    if @payment.save
        flash[:notice] = "Payment was created successfully."
        redirect_to unauthenticated_root_path
    else
       render 'new' 
    end
  end
  
  def index
    @payments = Payment.all
  end
  
  def show
  end
  
  private
    
  def payment_params
    params.require(:payment).permit(:amount, :card_expiry, :first_name, :last_name, :cvv, :card_number, :appointment_id)
  end
  
  def set_payment
    @payment = Payment.find(params[:id])
  end
end
