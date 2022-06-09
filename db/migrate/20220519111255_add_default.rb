class AddDefault < ActiveRecord::Migration[7.0]
  def change
    change_column :seats, :seat_status, :boolean, :default => false
  end
end
