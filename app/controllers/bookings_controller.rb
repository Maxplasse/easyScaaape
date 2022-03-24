class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @room = Room.find(params[:room_id])
    @booking = Booking.new(booking_params)
    @booking.room = @room
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to room_path(@room), notice: "Demande de réservation envoyée !"
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :room_id)
  end
end
