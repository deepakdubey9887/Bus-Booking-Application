class RemoveFieldsFromBusess < ActiveRecord::Migration[7.0]
  def change
    remove_column :travel_schedules , :user_id
  end
end
