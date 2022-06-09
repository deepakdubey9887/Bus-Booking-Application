class TravelSchedule < ApplicationRecord
    validates :boarding_date, presence: true    
    belongs_to :bus,dependent: :destroy

    has_many :seats
end