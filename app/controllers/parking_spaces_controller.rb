class ParkingSpacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_parking_space, only: [:show, :update, :edit, :destroy]

  def index
    @parking_spaces = policy_scope(ParkingSpace).order(created_at: :desc)
  end

  def show
    @booking = Booking.new
    @licenses = current_user.get_licenses
    authorize @parking_space
  end

  def new
    @parking_space = ParkingSpace.new
    @user = current_user
  end

  def create
    @parking_space = ParkingSpace.new(parking_space_params)
    @user = current_user
    @parking_space.user = @user
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

  private

  def parking_space_params
    params.require(:parking_space).permit(:address, :postcode, :city, :country, :latitude, :longitude, :category, :availability, :size, :price_per_hour)
  end

  def set_parking_space
    @parking_space = ParkingSpace.find(params[:id])
  end

end
