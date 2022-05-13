class DropDestination < ActiveRecord::Migration[7.0]
  def change
    drop_table :destination_cities
  end
end
