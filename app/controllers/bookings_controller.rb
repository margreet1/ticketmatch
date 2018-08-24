class BookingsController < ApplicationController

  def create
    @match = Match.find(params[:match_id])
    @seat = Seat.find(params[:seat_id])
    @booking = Booking.new(match: @match, seat: @seat, buyer: current_user, sold: true)
    authorize @booking
    @booking.save
    if @booking.seller == current_user
      redirect_to seat_path(@seat)
    else
      redirect_to dashboard_path
    end
  end

  # def destroy
  #   raise
  #   @booking = Booking.find
  #   booking = @seat.bookings.find { |booking| booking.match == match }
  #   redirect_to new_seat_booking_path
  # end
end
