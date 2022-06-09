class BookingDetail < ApplicationRecord
    belongs_to :user,optional: true
    belongs_to :bus, optional: true
    has_many :passanger_details
end
