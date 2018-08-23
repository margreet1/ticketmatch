class Seat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates_presence_of(:number, :description, :team)
end
