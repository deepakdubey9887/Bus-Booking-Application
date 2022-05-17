class AdCTSeats < ActiveRecord::Migration[7.0]
  def change
    add_column :seats, :bus_id, :integer
    add_column :seats, :seat_number, :string
  end
end
