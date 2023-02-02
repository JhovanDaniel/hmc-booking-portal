class Procedure < ApplicationRecord
    has_many :appointments
    
    enum procedure_type: [:General, :Vaccination, :Test, :Surgery, :Specialist]
    
    validates :name, :cost, :procedure_type, presence: true;
    
    
    def self.find_procedure_by_type(procedure)
      self.where(procedure_type: procedure)
    end
  
end
