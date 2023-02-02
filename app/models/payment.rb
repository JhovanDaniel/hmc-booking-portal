class Payment < ApplicationRecord
    belongs_to :appointment
    
    after_create :update_payment_data
    
  def update_payment_data
    appointment.update_attribute('status', Appointment::statuses[:active])
  end
end
