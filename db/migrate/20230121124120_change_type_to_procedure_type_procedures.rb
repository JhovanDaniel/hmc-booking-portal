class ChangeTypeToProcedureTypeProcedures < ActiveRecord::Migration[7.0]
  def change
    rename_column :procedures, :type, :procedure_type
  end
end
