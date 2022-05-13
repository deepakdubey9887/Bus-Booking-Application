class AddDestination < ActiveRecord::Migration[7.0]
  def change
    add_column :cities, :destination_city,:string
  end
end
