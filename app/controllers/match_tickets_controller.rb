class MatchTicketsController < ApplicationController

  def show
    @ticket = MatchTicket.find(params[:id])
    authorize @ticket
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end


  def destroy
  end
end
