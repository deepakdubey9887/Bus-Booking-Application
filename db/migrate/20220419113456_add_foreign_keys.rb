class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
  add_column :buses,:user_id,:int
  add_column :roles,:user_id,:int
  add_column :booking_details,:user_id,:int
  add_column :cities,:bus_id, :int
  remove_column :users,:role_id 
  remove_column :users,:bus_id   
  remove_column :buses,:city_id
  end
end
