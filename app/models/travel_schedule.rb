class TravelSchedule < ApplicationRecord
    validates :start_date, presence: true
    validates :end_date, presence: true
    
    belongs_to :bus, optional: true
end
