class Remove < ActiveRecord::Migration[7.0]
  def change
    remove_column :travel_schedules, :arrival_time
    remove_column :travel_schedules, :depature_time
    
  end
end
