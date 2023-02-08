class AddProcedureToTimeslot < ActiveRecord::Migration[7.0]
  def change
    remove_column :timeslots, :appointment_id
    
    add_column :timeslots, :procedure_id, :int 
  end
end
