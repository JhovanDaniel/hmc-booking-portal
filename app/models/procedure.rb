class Procedure < ApplicationRecord
    has_many :appointments
    has_many :timeslots
    
    enum procedure_type: [:General, :Vaccination, :Test, :Surgery, :Specialist]
    
    validates :name, :cost, :procedure_type, presence: true;
    
    
    def self.find_procedure_by_type(procedure)
      self.where(procedure_type: procedure)
    end
    
    def today
      Date.current
    end
    
    def weeks_from_now
      today.beginning_of_week..2.weeks.from_now
    end
  
end
