class ChangeIsAvailableToEnum < ActiveRecord::Migration[7.0]
  def change
    remove_column :procedures, :is_available
    
    add_column :procedures, :is_available, :int
  end
end
