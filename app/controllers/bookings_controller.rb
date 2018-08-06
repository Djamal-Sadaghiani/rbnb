class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :edit]
  before_action :set_parking_space, only: [:new, :create, :edit]

  def index
    @bookings = policy_scope(Booking)
    @bookings_data = []
    @bookings.each do |booking|
      @parking_space = ParkingSpace.find_by(id: booking.parking_space_id)
      @markers =
        {
          lat: @parking_space.latitude,
          lng: @parking_space.longitude
        }

      @booking_data = {
        booking: booking,
        markers: @markers,
        parking_space: @parking_space
      }

      @bookings_data << @booking_data
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.car = Car.find_by(license: params[:booking][:car_id])
    @booking.parking_space = @parking_space
    authorize @booking
    if @booking.save
      redirect_to parking_space_booking_path(@booking.parking_space, @booking)
      account_sid = ENV['TWILIO_SID']
      auth_token = ENV['TWILIO_AUTH_TOKEN']
      @client = Twilio::REST::Client.new(account_sid, auth_token)
      message = @client.messages.create(
                                       from: 'whatsapp:+14155238886',
                                       body: "Thank you for booking a parking place with Parkwise. The location of your Parking space is https://www.google.com/maps/search/?api=1&query=#{@booking.parking_space.latitude},#{@booking.parking_space.longitude}",
                                       to: 'whatsapp:+4915158581723'
                                     )
      message.sid
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
