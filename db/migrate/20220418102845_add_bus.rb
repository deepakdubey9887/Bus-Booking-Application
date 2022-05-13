class AddBus < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :from ,:string
    add_column :buses, :destination,:string
    add_column :buses, :bus_name ,:string
    add_column :buses, :datetime ,:datetime
    add_column :buses, :no_of_seats ,:int
  end
end
