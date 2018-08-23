class MatchesController < ApplicationController
  def index
    matches = policy_scope(Match).to_a
    @matches = matches.delete_if{ |match| match.date < Date.today }
    @august_matches = @matches.select { |match| (match.date >= Date.new(2018,8,1)) && (match.date < Date.new(2018,9,1)) }
    @september_matches = @matches.select { |match| (match.date >= Date.new(2018,9,1)) && (match.date < Date.new(2018,10,1)) }
    @october_matches = @matches.select { |match| (match.date >= Date.new(2018,10,1)) && (match.date < Date.new(2018,11,1)) }
    @november_matches = @matches.select { |match| (match.date >= Date.new(2018,11,1)) && (match.date < Date.new(2018,12,1)) }
    @december_matches = @matches.select { |match| (match.date >= Date.new(2018,12,1)) && (match.date < Date.new(2019,1,1)) }
    @january_matches = @matches.select { |match| (match.date >= Date.new(2019,1,1)) && (match.date < Date.new(2019,2,1)) }
    @february_matches = @matches.select { |match| (match.date >= Date.new(2019,2,1)) && (match.date < Date.new(2019,3,1)) }
    @march_matches = @matches.select { |match| (match.date >= Date.new(2019,3,1)) && (match.date < Date.new(2019,4,1)) }
    @april_matches = @matches.select { |match| (match.date >= Date.new(2019,4,1)) && (match.date < Date.new(2019,5,1)) }
    @may_matches = @matches.select { |match| (match.date >= Date.new(2019,5,1)) && (match.date < Date.new(2019,6,1)) }
    @june_matches = @matches.select { |match| (match.date >= Date.new(2019,6,1)) && (match.date < Date.new(2019,7,1)) }
    @july_matches = @matches.select { |match| (match.date >= Date.new(2019,7,1)) && (match.date < Date.new(2019,8,1)) }
  end

  def show

    @match = Match.find(params[:id])
    authorize @match

    # at the moment, on the match page, a list of seats is shown.
    # instead, you want a list of bookings to be shown.
    # those bookings should therefore already be created, but without a buyer saved to them.
    # (at the moment those bookings have not yet been created)
    # those bookings should be
    # 1. for that particular home_team
    # 2. unsold
    # 3. unreserved


    seats = Seat.where(team: @match.home_team)
    @seats = []
    seats.each do |seat|
      unless Booking.where("match_id = ? and seat_id = ?", @match.id, seat.id).length > 0
        @seats << seat
      end
    end
  end
end
