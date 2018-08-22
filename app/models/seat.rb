class Seat < ApplicationRecord
  belongs_to :user
  has_many :match_tickets
  validates_presence_of(:number, :description, :team)
end
