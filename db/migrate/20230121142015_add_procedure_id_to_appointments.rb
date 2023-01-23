class AddProcedureIdToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :procedure_id, :int, foreign_key: true
  end
end
