class AddDescriptionDetailsToProcedures < ActiveRecord::Migration[7.0]
  def change
    add_column :procedures, :description, :text
    add_column :procedures, :details, :text
  end
end
