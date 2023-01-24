class RemoveDoctorFromAppointments < ActiveRecord::Migration[7.0]
  def change
    remove_column :appointments, :doctor
    
    add_column :appointments, :doctor_id, :int, foreign_key: true
  end
end
