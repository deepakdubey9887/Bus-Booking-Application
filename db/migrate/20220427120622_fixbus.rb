class Fixbus < ActiveRecord::Migration[7.0]
  def change
    rename_column :buses, :from, :boarding
  end
end
