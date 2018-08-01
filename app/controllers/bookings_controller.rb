class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :update, :edit]

  def new
    @user = current_user
    @parking_space = ParkingSpace.find(params[:parking_space_id])
    @booking = Booking.new
  end

  def create
    raise
    @booking = Booking.new(booking_params)
    @booking.price = 2
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

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

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :price, :status)
  end
end
