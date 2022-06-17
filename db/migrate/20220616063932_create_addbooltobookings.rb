class CreateAddbooltobookings < ActiveRecord::Migration[7.0]
  def change
    create_table :addbooltobookings do |t|
      add_column :booking_details, :is_paid?, :boolean, default: :false
      #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")

      t.timestamps
    end
  end
end
