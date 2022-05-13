class CreateBookingDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_details do |t|

      t.timestamps
    end
  end
end
