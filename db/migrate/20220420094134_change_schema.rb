class ChangeSchema < ActiveRecord::Migration[7.0]
  def change
    
    add_column :booking_details, :pnr_no, :string
    add_column :users, :role_id, :int
    remove_column :roles, :user_id
    add_column :cities, :user_id, :int
  
  end
end
