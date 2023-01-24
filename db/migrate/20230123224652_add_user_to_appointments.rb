class AddUserToAppointments < ActiveRecord::Migration[7.0]
  def change
  end
  remove_column :appointments, :doctor_id
    
    add_column :appointments, :user_id, :int, foreign_key: true
end
