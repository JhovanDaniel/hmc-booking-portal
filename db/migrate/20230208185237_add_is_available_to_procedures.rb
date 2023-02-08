class AddIsAvailableToProcedures < ActiveRecord::Migration[7.0]
  def change
    add_column :procedures, :is_available, :boolean, default: true
  end
end
