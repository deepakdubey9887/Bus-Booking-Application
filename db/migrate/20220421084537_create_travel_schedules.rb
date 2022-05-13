class CreateTravelSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :travel_schedules do |t|

      t.timestamps
    end
  end
end
