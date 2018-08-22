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
    @seats = Seat.where(team: @match.home_team)
  end
end
