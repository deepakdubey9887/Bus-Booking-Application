class Bus < ApplicationRecord
  validates :bus_name, presence: true
  validates :boarding, presence: true
  validates :destination, presence: true
  validates :no_of_seats, presence: true
  validates :time, presence: true

  
  belongs_to :user,optional: true
  has_many :booking_details
  has_many :travel_schedules
  accepts_nested_attributes_for :travel_schedules, allow_destroy: true
  has_many :seats
  has_many :passanger_details
  accepts_nested_attributes_for :seats, allow_destroy: true

  
  
end
