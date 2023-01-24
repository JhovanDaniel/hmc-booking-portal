class AddAppointmentIdToResults < ActiveRecord::Migration[7.0]
  def change
    
    remove_column :appointments, :result_id
    add_column :results, :appointment_id, :int, foreign_key: true
  end
end
