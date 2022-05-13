class CreateSourceCities < ActiveRecord::Migration[7.0]
  def change
    create_table :source_cities do |t|

      t.timestamps
    end
  end
end
