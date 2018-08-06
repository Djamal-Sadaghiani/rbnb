class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :edit]
  before_action :set_parking_space, only: [:new, :create, :edit]

  def index
    @bookings = policy_scope(Booking)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.car = Car.find_by(license: params[:booking][:car_id])
    @booking.parking_space = @parking_space
    authorize @booking
    if @booking.save
      redirect_to parking_space_booking_path(@booking.parking_space, @booking)
    else
      flash[:alert] = 'Invalid input'
      redirect_to parking_space_path(@parking_space)
    end
  end

  def show
    authorize @booking
    @parking_space = ParkingSpace.find_by(id: @booking.parking_space_id)
    @car = Car.find_by(id: @booking.car_id)
  end

  def edit
    authorize @booking
  end

  def update
    @booking.parking_space = ParkingSpace.find(params[:parking_space_id])
    @booking.car = Car.find_by(license: params[:license])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to parking_space_booking_path(@booking.parking_space, @booking)
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_parking_space
    @parking_space = ParkingSpace.find(params[:parking_space_id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :price, :status)
  end
end
