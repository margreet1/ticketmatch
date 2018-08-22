class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    matches = policy_scope(Match).to_a
    @matches = matches.delete_if{ |match| match.date < Date.today }
  end

  def dashboard
    @seats = current_user.seats
    @bookings = current_user.bookings
  end
end
