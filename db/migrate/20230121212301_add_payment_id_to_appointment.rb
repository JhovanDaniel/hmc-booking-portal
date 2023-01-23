class AddPaymentIdToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :payment_id, :int, foreign_key: true
  end
end
