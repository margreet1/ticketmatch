class SeatsController < ApplicationController

  def create
    @seat = Seat.new(seat_params)
    if @seat.save
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def new
  @seat = Seat.new
  end

  def show
  end



end
