class CreateProcedures < ActiveRecord::Migration[7.0]
  def change
    create_table :procedures do |t|
      
      t.string :name
      t.float :cost
      t.integer :type

      t.timestamps
    end
  end
end
