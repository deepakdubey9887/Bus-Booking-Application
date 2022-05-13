class Removerename < ActiveRecord::Migration[7.0]
  def change
    drop_table :rename_cities
  end
end
