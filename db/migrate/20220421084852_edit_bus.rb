class EditBus < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :date, :date
    add_column :buses, :time, :time
    remove_column :buses, :datetime
    add_column :travel_schedules, :bus_id, :int
    add_column :travel_schedules, :user_id, :int
    add_column :travel_schedules, :start_date, :date
    add_column :travel_schedules, :end_date, :date
    add_column :travel_schedules, :depature_time, :time
    add_column :travel_schedules, :arrival_time, :time
    add_column :passanger_details, :booking_id, :int
    add_column :passanger_details, :name, :string
    add_column :passanger_details, :age, :int
    add_column :passanger_details, :gender, :string
    add_column :booking_details, :bus_id,:int 


  end
end
