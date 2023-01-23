class AddDateAndTimeToAppointments < ActiveRecord::Migration[7.0]
  
  def change
    add_column :appointments, :date, :date
    add_column :appointments, :time, :time
  end
end
