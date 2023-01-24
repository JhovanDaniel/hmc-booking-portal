class AddDoctorToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :doctor, :int, foreign_key: true
  end
end
