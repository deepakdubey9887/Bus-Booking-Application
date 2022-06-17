class Deletecolumsfuser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :is_paid
  end
end
