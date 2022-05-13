class RemoveFieldsFromBuses < ActiveRecord::Migration[7.0]
  def change
    remove_column :buses, :start_date
    remove_column :buses, :end_date
  end
end
