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
    @seat = Seat.new
    authorize @seat
  end

  def show
  end

  private
  def seat_params
    params.require(:seat).permit(:number, :description, :view)
  end


end
