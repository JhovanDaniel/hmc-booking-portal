class AddApprovalStatusToResults < ActiveRecord::Migration[7.0]
  def change
    add_column :results, :approval_status, :boolean
  end
end
