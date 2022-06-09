class Seat < ApplicationRecord
    belongs_to :travel_schedule, dependent: :destroy
    belongs_to :bus,dependent: :destroy

end
