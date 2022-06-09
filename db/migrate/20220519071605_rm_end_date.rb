class RmEndDate < ActiveRecord::Migration[7.0]
  def change
    remove_column :travel_schedules, :end_date 
  end
end
