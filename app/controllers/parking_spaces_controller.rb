class ParkingSpacesController < ApplicationController
  before_action :set_parking_space, only: [:show, :update, :edit, :destroy]
  skip_before_action :authenticate_user!, only: [:search, :show]
  skip_after_action :verify_authorized, only: [:search, :show]

  def index
    @parking_spaces = policy_scope(ParkingSpace).order(created_at: :desc)
  end

  def show
    @marker = { lat: @parking_space.latitude, lng: @parking_space.longitude}
    @booking = Booking.new
    @licenses = current_user.get_licenses
    authorize @parking_space
  end

  def new
    @parking_space = ParkingSpace.new
    authorize @parking_space
    @user = current_user
  end

  def create
    @parking_space = ParkingSpace.new(parking_space_params)
    @user = current_user
    @parking_space.user = @user
    authorize @parking_space
    if @parking_space.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    authorize @parking_spaces
    @parking_space.update(parking_space_params)
    if @parking_space.update
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    authorize @parking_spaces
    @parking_space.destroy
    redirect_to root_path
  end

  def search
    if params[:cord].nil?
      result = Geocoder.search(params[:search][:query])
      @location = result.first.coordinates
    else
      @location = params[:cord].split(" ")
    end
    @parking_spaces = ParkingSpace.near(@location,1)
    if @parking_spaces.length == 0
      @markers =
        {
          lat: @location[0],
          lng: @location[1],
        }
      render :add_space
    else
      @markers = @parking_spaces.map do |space|
        {
          lat: space.latitude,
          lng: space.longitude#,
        }
      end
    end
  end


  private

  def parking_space_params
    params.require(:parking_space).permit(:address, :postcode, :city, :country, :latitude, :longitude, :category, :availability, :size, :price_per_hour)
  end


  def set_parking_space
    @parking_space = ParkingSpace.find(params[:id])
  end

end
