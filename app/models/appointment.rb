class Appointment < ApplicationRecord
    belongs_to :procedure
    has_one :payment, dependent: :destroy
    belongs_to :user, optional: true
    
    before_create :generate_appointment_number
    
    cattr_accessor :appointment_steps do
      %w[appointment_information review pay]
    end
    
    attr_accessor :appointment_step
    
    validates :first_name, :last_name, :date_of_birth, :gender, :phone, :email, :date, :time, :procedure_id, presence: true,
      if: -> { required_appointment_step?(:appointment_information)}
    
    def generate_appointment_number
      begin
        self.appointment_number = "HMCAP-#{[*'A'..'Z', *0..9].sample(6).join}"
      end while self.class.exists?(appointment_number: appointment_number)
    end
    
    def appointment_cost
      self.procedure.cost
    end
    
    private
    
    def required_appointment_step?(step)
      return true if appointment_step.nil?
      return true if self.appointment_steps.index(step.to_s) <= self.appointment_steps.index(appointment_step)
    end
end
