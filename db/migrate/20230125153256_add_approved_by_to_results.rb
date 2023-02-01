class AddApprovedByToResults < ActiveRecord::Migration[7.0]
  def change
    add_column :results, :approved_by, :int
  end
end
