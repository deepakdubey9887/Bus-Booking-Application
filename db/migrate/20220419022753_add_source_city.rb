class AddSourceCity < ActiveRecord::Migration[7.0]
  def change
    add_column :source_cities, :source_city_name, :string
  end
end
