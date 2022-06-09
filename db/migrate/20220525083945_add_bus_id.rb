class AddBusId < ActiveRecord::Migration[7.0]
  def change
    add_column :passanger_details, :bus_id, :integer
  end
end
