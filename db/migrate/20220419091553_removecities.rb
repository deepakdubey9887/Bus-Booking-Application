class Removecities < ActiveRecord::Migration[7.0]
  def change
    remove_column :cities ,:source_city_name
    remove_column :cities, :destination_city
    add_column :cities, :city_name, :string
  end
end
