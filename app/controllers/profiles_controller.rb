class ProfilesController < ApplicationController

  def show
    @my_bookings = Booking.all.select { |booking| booking.user == current_user }
  end
end
