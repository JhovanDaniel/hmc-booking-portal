class AddResultToAppointments < ActiveRecord::Migration[7.0]
  def change
    
    remove_column :results, :appointment_id
    
    add_column :appointments, :result_id, :int, foreign_key: true
  end
end
