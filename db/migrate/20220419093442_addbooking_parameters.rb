class AddbookingParameters < ActiveRecord::Migration[7.0]
  def change
    add_column :booking_details, :PNR, :string 
    add_column :booking_details, :payment_id, :int
    
  end
end
