class RemoveProcedureTypeFromAppointments < ActiveRecord::Migration[7.0]
  def change
    remove_column :appointments, :procedure_type
  end
end
