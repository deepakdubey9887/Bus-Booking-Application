class AddKeys < ActiveRecord::Migration[7.0]
  def change
  add_column :users, :role_id, :int
  add_column :users, :bus_id, :int
  end
end
