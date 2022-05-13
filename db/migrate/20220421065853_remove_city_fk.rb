class RemoveCityFk < ActiveRecord::Migration[7.0]
  def change
    remove_column :cities, :bus_id
    remove_column :cities, :user_id
  end
end
