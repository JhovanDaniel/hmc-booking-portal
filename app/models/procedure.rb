class Procedure < ApplicationRecord
  include ApplicationHelper
  
  has_many :appointments
  has_many :timeslots
    
    enum procedure_type: [:General, :Vaccination, :Test, :Surgery, :Specialist]
    
    validates :name, :cost, :procedure_type, presence: true;
    
  def format_date(date)
    date.strftime("%b %-d, %Y")
  end
    
  def self.find_procedure_by_type(procedure)
    self.where(procedure_type: procedure)
  end
  
  def today
    Date.current
  end
  
  def weeks_from_now
    today.beginning_of_week..2.weeks.from_now
  end
  
  def self.general
    self.where(procedure_type: "General").first.id
  end
  
  def self.vaccination
    self.where(procedure_type: "Vaccination").first.id
  end
  
  def self.test
    self.where(procedure_type: 2).first.id
  end
  
  def self.surgery
    self.where(procedure_type: 3).first.id
  end
  
  def self.specialist
    self.where(procedure_type: 4).first.id
  end
  
  def bookable(date, time)
    date = format_date(date.to_date)
    time = format_time(time.to_time)
    Appointment.active.where(date: date, time: time).count < self.booking_limit
  end
  
end
