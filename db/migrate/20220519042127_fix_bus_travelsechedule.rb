class FixBusTravelsechedule < ActiveRecord::Migration[7.0]
  def change
    remove_column :travel_schedules ,:start_date
    remove_column :travel_schedules ,:start_date
    add_column :buses ,:start_date, :date
    add_column :buses ,:end_date, :date
    remove_column :seats ,:seat_number
    add_column :travel_schedules ,:boarding_date, :date

    add_column :seats ,:seat_status, :boolean



  end
end
