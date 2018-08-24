class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    matches = policy_scope(Match).to_a
    @matches = matches.delete_if{ |match| match.date < Date.today }
  end

  def dashboard
    @seats = current_user.seats
    all_bookings = current_user.bookings
    @foreign_bookings = all_bookings.reject { |booking| @seats.include?(booking.seat) }
    @sold_tickets = []
    sold_tickets = Booking.all
    sold_tickets.each do |booking|
      if (booking.seller == current_user) && (booking.buyer != current_user)
        @sold_tickets << booking
      end
    end
  end
end
