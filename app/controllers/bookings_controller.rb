class BookingsController < ApplicationController

  # def new
  # end

  def create
    @match = Match.find(params[:match_id])
    @seat = Seat.find(params[:seat_id])
    @booking = Booking.new(match: @match, seat: @seat, buyer: current_user, sold: true)
    authorize @booking
    @booking.save
    redirect_to dashboard_path
  end
end



 # @seller = User.find(params[:])
