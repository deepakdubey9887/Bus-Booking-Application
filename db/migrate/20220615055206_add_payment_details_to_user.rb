class AddPaymentDetailsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_paid, :boolean, :default => false
  end
end
