class SeatsController < ApplicationController

  def create
    @seat = Seat.new(seat_params)
    @seat.user = current_user
    authorize @seat
    if @seat.save
      redirect_to dashboard_path
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
  end

  private
  def seat_params
    params.require(:seat).permit(:number, :description, :view, :team, :price, :photo)
  end

end
