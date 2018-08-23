class Match < ApplicationRecord
  has_many :bookings
  validates_presence_of(:date, :home_team, :away_team)
end
