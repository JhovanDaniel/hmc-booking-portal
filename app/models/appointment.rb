class Appointment < ApplicationRecord
    belongs_to :procedure
    has_one :payment, dependent: :destroy
    belongs_to :user, optional: true
    
    before_create :generate_appointment_number
    
    cattr_accessor :appointment_steps do
      %w[appointment_information timeslots review pay]
    end
    
    enum status: [:active, :inactive, :cancelled]
    
    attr_accessor :appointment_step
    
    validates :first_name, :last_name, :date_of_birth, :gender, :phone, :email, :procedure_id, presence: true,
      if: -> { required_appointment_step?(:appointment_information)}
        
    validates :time, :date, presence: true,
    if: -> { required_appointment_step?(:timeslots)}
    
    def generate_appointment_number
      begin
        self.appointment_number = "HMCAP-#{[*'A'..'Z', *0..9].sample(6).join}"
      end while self.class.exists?(appointment_number: appointment_number)
    end
    
    def name
      "#{first_name} #{last_name}"
    end
    
    def self.active
      self.where(status: self.statuses[:active])
    end
    
    def self.cancelled
      self.where(status: self.statuses[:cancelled])
    end
    
    def appointment_cost
      self.procedure.cost
    end
    
    def booked_by
      "#{first_name} #{last_name}"
    end
    
    
    def is_today?
      format_date(self.date) == format_date(Date.today)
    end
  
    def is_before_today?
      format_date(self.date) < format_date(Date.today)
    end
  
    def is_after_today?
      format_date(self.date) > format_date(Date.today)
    end
    
    def self.is_today_count
      self.where(date: Date.today).count
    end
  
    def self.is_after_today_count
      self.where('date > ?', Date.today).count
    end
  
    def self.is_before_today_count
      self.where('date < ?', Date.today).count
    end
    
    def self.type_count(type)
      self.active.joins(:procedure).where('procedures.procedure_type.key' => type).count
    end
    
    def self.most_procedure(index)
      max = self.active.group(:procedure_id).count.max_by(index){ |obj| obj[1]}
      max[index-1] != nil ? max[index-1].first : nil
    end
    
    private
    
    def required_appointment_step?(step)
      return true if appointment_step.nil?
      return true if self.appointment_steps.index(step.to_s) <= self.appointment_steps.index(appointment_step)
    end
end
