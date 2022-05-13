class CreateRenameCities < ActiveRecord::Migration[7.0]
  def change
    create_table :rename_cities do |t|
      rename_table :source_cities, :cities

      t.timestamps
    end
  end
end
