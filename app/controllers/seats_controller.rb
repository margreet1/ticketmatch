class SeatsController < ApplicationController

  def create
    @seat = Seat.new(seat_params)
    @seat.user = current_user
    authorize @seat

    if @seat.save
      redirect_to seat_path(@seat)
    else
      render 'new'
    end
  end

  def new
    @teams = ["Manchester United",
 "Newcastle",
 "Bournemouth",
 "Fulham",
 "Huddersfield",
 "Watford",
 "Wolverhampton",
 "Liverpool",
 "Southampton",
 "Arsenal",
 "Cardiff",
 "West Ham",
 "Tottenham",
 "Leicester",
 "Everton",
 "Chelsea",
 "Burnley",
 "Manchester City",
 "Brighton",
 "Crystal Palace"]
    @seat = Seat.new
    @matches = Match.all
    authorize @seat
  end

  def show
    @booking = Booking.new
    @seat = Seat.find(params[:id])
    team = @seat.team
    authorize @seat

    all_matches = Match.where('home_team = ?', team)
    @reserved_matches = []
    current_user.bookings.each do |booking|
      @reserved_matches << booking.match if all_matches.include?(booking.match)
    end

    @unreserved_matches = []
    all_matches.each do |match|
      @unreserved_matches << match unless @seat.bookings.any? { |booking| Match.find(booking.match_id) == match }
    end

    @bookings = Booking.all
  end

  private
  def seat_params
    params.require(:seat).permit(:number, :description, :view, :team, :price, :photo, :photo_cache)
  end

end
