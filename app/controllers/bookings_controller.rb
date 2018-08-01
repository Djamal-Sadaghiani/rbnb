class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :update, :edit]

  def new
    @parking_space = ParkingSpace.find(params[:id])
    @booking = Booking.new
  end

  # def create
  #   @booking = Booking.new(booking_params)
  #   if @booking.save
  #     redirect_to @booking
  #   else
  #     render :new
  # end

  # def show
  #   #render
  # end

  # def edit
  #   #render
  # end

  # def update
  #   @booking(booking_params)
  # end

  private

  # def set_booking
  #   @booking = Booking.find(params[:id])
  # end

  # def booking_params
  #   params.require(:booking).permit(:start_time, :end_time, :price, :status)
  # end
end
