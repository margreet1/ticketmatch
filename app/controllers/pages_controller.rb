class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    matches = policy_scope(Match).to_a
    @matches = matches.delete_if{ |match| match.date < Date.today }
  end

  def dashboard
    @seats = current_user.seats
    @bookings = current_user.bookings
    @sold_tickets = []
    sold_tickets = Booking.all
    sold_tickets.each do |booking|
      if booking.seat.user == current_user
        @sold_tickets << booking
      end
    end
  end
end
