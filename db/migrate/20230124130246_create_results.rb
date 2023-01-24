class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      
      t.date :result_date
      t.string :result_outcome
      t.string :comments
      t.integer :appointment_id, foreign_key: true

      t.timestamps
    end
  end
end
