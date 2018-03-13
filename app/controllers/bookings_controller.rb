
class BookingsController < ApplicationController
  def create
    booking_done = BookingService.new(booking_params).call
    render status: :ok, json: { message: 'Booking created.' } if booking_done
    render status: :unprocessable_entity, json: { message: 'Booking conflict.' } if booking_done == false
  rescue => e   ## avoid without specifying error class 
    render status: 500, json: { message: e.message, backtrace: e.backtrace }
  end

  private

  def booking_params
    params.permit(:start, :end, :room_id)
  end
end
