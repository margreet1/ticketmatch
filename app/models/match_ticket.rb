class MatchTicket < ApplicationRecord
  belongs_to :seat
  belongs_to :match
  has_one :booking
  has_one :buyer, through: :booking, source: :user
  has_one :seller, through: :seat, source: :user


  validates_presence_of(:price)
end
