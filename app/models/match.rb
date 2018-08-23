class Match < ApplicationRecord
  has_many :bookings
  validates_presence_of(:date, :home_team, :away_team)

  include PgSearch
  pg_search_scope :search_by_home_team_and_away_team,
    against: [ :home_team, :away_team ],
    using: {
      tsearch: {prefix: true}
    }
end
