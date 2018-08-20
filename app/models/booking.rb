class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :match_ticket

  def seller
    self.match_ticket.seat.user
  end
end
