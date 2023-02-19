class Procedure < ApplicationRecord
  include ApplicationHelper
  
  has_many :appointments
  has_many :timeslots
    
    enum procedure_type: [:General, :Vaccination, :Test, :Surgery, :Specialist]
    enum is_available: [:Available, :Always_available, :Not_available]
    
    validates :name, :cost, :procedure_type, presence: true;
    
  def format_date(date)
    date.strftime("%b %-d, %Y")
  end
    
  def self.find_procedure_by_type(procedure)
    self.where(procedure_type: procedure)
  end
  
  def find_procedure_type
    self.procedure_type
  end
  
  def today
    Date.current + 1
  end
  
  def available_days
    if self.is_available == 'Always_available'
      today..3.weeks.from_now 
    else
      ((self.start_date - self.end_date).to_i).abs > 21 ? self.start_date..3.weeks.from_now : self.start_date.. self.end_date
    end
  end
  
  def bookable(date, time)
    date = format_date(date.to_date)
    time = format_time(time.to_time)
    Appointment.active.where(date: date, time: time).count < self.booking_limit
  end
  
  def self.procedure_type_count(type)
    self.where(procedure_type: type).count
  end
  
  def self.availability_count(availability)
    self.where(is_available: availability).count
  end
  
  
  
end
