class BookingsController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @booking = Booking.new(booking_params)
    @booking.room = @room
    @booking.user = current_user
    @booking.save
    if @booking.save
      redirect_to room_path(@room), notice: "Demande de réservation envoyée ! Suivez votre demande sur votre espace profil"
    else
      redirect_to room_path(@room), notice: "Veuillez renseigner une date d'arrivée et de départ."
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end
end
