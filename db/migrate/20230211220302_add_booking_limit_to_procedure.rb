class AddBookingLimitToProcedure < ActiveRecord::Migration[7.0]
  def change
    add_column :procedures, :booking_limit, :int
  end
end
