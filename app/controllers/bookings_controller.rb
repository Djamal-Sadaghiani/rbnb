class BookingsController < ApplicationController

  def new
    @user = current_user
    @cars = @user.cars
    @licenses = []
    @cars.each do |car|
      @licenses << car.license
    end
    @parking_space = ParkingSpace.find(params[:parking_space_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.price = 2
    @booking.parking_space = ParkingSpace.find(params[:parking_space_id])
    @booking.car = Car.find_by(license: params[:license])
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

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
