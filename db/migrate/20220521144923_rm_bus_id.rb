class RmBusId < ActiveRecord::Migration[7.0]
  def change
    remove_column :seats, :bus_id
    add_column :seats, :travel_schedule_id, :int
    end
end
