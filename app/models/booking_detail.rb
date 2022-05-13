class BookingDetail < ApplicationRecord
    belongs_to :user,optional: true
    belongs_to :bus, optional: true
    
end
