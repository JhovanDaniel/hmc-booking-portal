class ChangeTimeslotTimeToString < ActiveRecord::Migration[7.0]
  def change
    
    remove_column :timeslots, :time
    
    add_column :timeslots, :time, :string, array: true, default: []
    
  end
end
