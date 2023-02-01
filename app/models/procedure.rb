class Procedure < ApplicationRecord
    has_many :appointments
    
    enum procedure_type: [:General, :Surgery, :Test]
    
    def self.find_general_procedures
      self.where(procedure_type: 0)
    end
    
    def find_procedure_by_type
      Procedure.where(procedure_type: self.procedure_type)
    end
  
end
