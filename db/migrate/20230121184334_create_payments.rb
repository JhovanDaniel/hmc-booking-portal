class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      
      t.string :first_name
      t.string :last_name
      t.integer :card_number
      t.date :card_expiry
      t.integer :cvv
      
      t.timestamps
    end
  end
end
