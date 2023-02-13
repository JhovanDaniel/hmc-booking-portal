class AddProcedureStartAndEndDate < ActiveRecord::Migration[7.0]
  def change
    add_column :procedures, :start_date, :date
    add_column :procedures, :end_date, :date
  end
end
