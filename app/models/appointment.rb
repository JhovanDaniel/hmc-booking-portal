class Appointment < ApplicationRecord
    belongs_to :procedure
    belongs_to :payment, optional: true
    belongs_to :user, optional: true
end
