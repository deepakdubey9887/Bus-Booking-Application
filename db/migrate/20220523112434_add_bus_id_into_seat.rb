class AddBusIdIntoSeat < ActiveRecord::Migration[7.0]
  def change
    add_column :seats, :bus_id, :int
  end
end
