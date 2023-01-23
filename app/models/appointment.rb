class Appointment < ApplicationRecord
    belongs_to :procedure
    belongs_to :payment
end
