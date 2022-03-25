class BookingsController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @booking = Booking.new(booking_params)
    @booking.room = @room
    @booking.user = current_user
    @booking.save
    if @booking.save
      redirect_to room_path(@room), notice: "Demande de réservation envoyée !"
    else
      redirect_to room_path(@room), notice: "Votre réservation n'a pas été prise en compte !"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end
end
