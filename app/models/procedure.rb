class Procedure < ApplicationRecord
    has_many :appointments
    
    enum procedure_type: [:General, :Surgery, :Test]
end
