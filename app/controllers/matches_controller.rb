class MatchesController < ApplicationController
  def index
    @matches = policy_scope(Match)
  end

  def show
    @match = Match.find(params[:id])
    authorize @match
  end
end
