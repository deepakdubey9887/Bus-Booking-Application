class BusTableAltration < ActiveRecord::Migration[7.0]
  def change
    remove_column :buses, :date
    add_column :buses, :start_date, :date
    add_column :buses, :end_date, :date
  end
end
