class ParkingSpacesController < ApplicationController

before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @parking_spaces = ParkingSpace.all
  end

  def show
    @parking_space = ParkingSpace.find(params[:id])
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
    @parking_space = ParkingSpace.find(params[:id])
  end

  def update
    @parking_space = ParkingSpace.find(params[:id])
    @parking_space.update(parking_space_params)
    if @parking_space.update
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @parking_space = ParkingSpace.find(params[:id])
    @parking_space.destroy
    redirect_to root_path
  end

  private

  def parking_space_params
    params.require(:parking_space).permit(:address, :postcode, :city, :country, :latitude, :longitude, :category, :availability, :size, :price_per_hour)
  end

end
