class MatchesController < ApplicationController
  def index
    matches = policy_scope(Match).to_a
    @matches = matches.delete_if{ |match| match.date < Date.today }
  end

  def show
    @match = Match.find(params[:id])
    @tickets = @match.match_tickets
    authorize @match
  end
end
