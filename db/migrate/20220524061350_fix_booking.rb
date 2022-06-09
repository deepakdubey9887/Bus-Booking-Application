class FixBooking < ActiveRecord::Migration[7.0]
  def change
    remove_column :booking_details, :payment_id
    remove_column :booking_details, :pnr_no
    
  end
end
