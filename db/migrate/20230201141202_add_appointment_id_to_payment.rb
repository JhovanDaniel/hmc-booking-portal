class AddAppointmentIdToPayment < ActiveRecord::Migration[7.0]
  def change
    
    remove_column :appointments, :payment_id
    add_column :payments, :appointment_id, :int
  end
end
