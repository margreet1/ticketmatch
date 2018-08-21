class MatchesController < ApplicationController
  def index
    matches = policy_scope(Match).to_a
    @matches = matches.delete_if{ |match| match.date < Date.today }
  end

  def show
    @match = Match.find(params[:id])
    authorize @match
    # @seats = Seat.where(team: @match.home_team)
  end
end
