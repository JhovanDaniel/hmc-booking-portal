class CreateTimeslots < ActiveRecord::Migration[7.0]
  def change
    create_table :timeslots do |t|
      
      t.integer :day
      t.time :time, array: true, default: []
      t.integer :appointment_id

      t.timestamps
    end
  end
end
