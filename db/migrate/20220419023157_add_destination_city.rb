class AddDestinationCity < ActiveRecord::Migration[7.0]
  def change
    add_column :destination_cities, :destination_city_name, :string
  end
end
