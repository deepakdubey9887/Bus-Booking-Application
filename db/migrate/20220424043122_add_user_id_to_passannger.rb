class AddUserIdToPassannger < ActiveRecord::Migration[7.0]
  def change
    add_column :passanger_details, :user_id, :int
  end
end
