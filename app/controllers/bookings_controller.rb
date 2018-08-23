class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    authorize @booking
    @seat = Seat.find(params[:seat_id])
    team = @seat.team
    @matches = Match.where('home_team = ?', team)

    @reserved_matches = []
    current_user.bookings.each do |booking|
      @reserved_matches << booking.match
    end

    @unreserved_matches = []
    @matches.each do |match|
      unless @reserved_matches.include?(match)
        @unreserved_matches << match
      end
    end

    @bookings = Booking.all
  end

  def create
    @match = Match.find(params[:match_id])
    @seat = Seat.find(params[:seat_id])
    @booking = Booking.new(match: @match, seat: @seat, buyer: current_user, sold: true)
    authorize @booking
    @booking.save
    if @booking.buyer == current_user
      redirect_to new_seat_booking_path(@seat)
    else
      redirect_to dashboard_path
    end
  end

  def destroy
    raise
    # @booking = Booking.find
    booking = @seat.bookings.find { |booking| booking.match == match }
    redirect_to new_seat_booking_path
  end
end



 # @seller = User.find(params[:])
