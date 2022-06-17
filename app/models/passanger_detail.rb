class PassangerDetail < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :gender, inclusion: { in: ["Male", "Female"] }
  belongs_to :user
  belongs_to :bus
end
