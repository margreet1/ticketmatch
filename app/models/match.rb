class Match < ApplicationRecord
  has_many :match_tickets
  validates_presence_of(:date, :home_team, :away_team)
end
