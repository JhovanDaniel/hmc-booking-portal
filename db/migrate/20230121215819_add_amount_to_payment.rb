class AddAmountToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :amount, :float
  end
end
